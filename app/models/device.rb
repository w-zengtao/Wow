class Device < ActiveRecord::Base
  validates :device_token, presence: true
end
