class Device < ActiveRecord::Base
  validates :device_token, presence: true, uniqueness: true

  belongs_to :user
end
