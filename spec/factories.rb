FactoryGirl.define do  
  factory :location do
    position [0.0111111 , 1.1111111]

    # after_build do |location|
    #   pos.posts << FactoryGirl.build(:post, :location => location)
    # end
  end
  
  factory :post do
    content "MyText"
    photo "MyString"
    position "MyString"

    # after_build do |post|
    #   post
    # end
  end
  
  factory :device do
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