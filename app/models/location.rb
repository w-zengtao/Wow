class Location < ActiveRecord::Base

  require 'net/http'

  has_many :posts

  before_save :add_location_content

  # 想知道这里有没有数据库层面的方法 
  # 或者ActiveRecord find / where

  # 后期会给这个Location加上标记标志大概范围 例如上海市 徐汇区 这样的来初步过滤掉很多无用信息 多级的自我索引
  def locations_by_dis dis
    @locations = Location.all

    @locations.select do |loc|
      self.lonlat.distance(loc.lonlat) <= dis
    end
  end

  def add_location_content
    @@baidu_add = "http://api.map.baidu.com/geocoder/v2/?ak=Z2n0xhSAvdEa6vXlzQz01pBp&callback=renderReverse&location=#{self.lonlat.x},#{self.lonlat.y}&output=json&pois=1"
    
    url = URI.parse(@@baidu_add)
    req = Net::HTTP::Get.new(url)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end

    self.content = res.body.to_s.split('formatted_address')[1].split('"')[2].to_s
  end
end
