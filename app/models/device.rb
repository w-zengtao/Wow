class Device < ActiveRecord::Base
  validates :device_token, presence: true

  belongs_to :user
end
