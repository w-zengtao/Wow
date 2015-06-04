require 'rails_helper'

FactoryGirl.define do 
  factory :user do
    nickname        "nick"
    sequence(:email)          { |n| "nick#{n}@test.com" }
    encrypted_password  "password"
  end
end