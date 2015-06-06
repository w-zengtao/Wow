class Device < ActiveRecord::Base
  validates :device_token, presence: true, uniq: true

  belongs_to :user
end
