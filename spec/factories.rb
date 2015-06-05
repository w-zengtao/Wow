FactoryGirl.define do  factory :device do
    os "MyString"
version "MyString"
device_token "MyString"
  end
 
  factory :user do
    nickname        "nick"
    sequence(:email)          { |n| "nick#{n}@test.com" }
    encrypted_password  "password"
  end
end