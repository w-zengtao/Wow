class Location < ActiveRecord::Base
  has_many :posts

  # 想知道这里有没有数据库层面的方法 
  # 或者ActiveRecord find / where

  # 后期会给这个Location加上标记标志大概范围 例如上海市 徐汇区 这样的来初步过滤掉很多无用信息 多级的自我索引
  def locations_by_dis dis
    @locations = Location.all

    @locations.select do |loc|
      self.lonlat.distance(loc.lonlat) <= dis
    end
  end
end
