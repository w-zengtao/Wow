require 'rails_helper'

RSpec.describe User, :type => :model do

  before { @user = User.create!(email: "test@gmail.com", encrypted_password: 'aaaaaaaaa') }
  subject { @user }

  it "should create auth_token auto" do
    expect(@user.auth_token).not_to be_nil
  end

  it "should encrypted_password" do 
    expect(@user.encrypted_password).not_to be 'aaaaaaaaa'
  end

  it "encrypted_password should be" do
    expect(@user.encrypted_password).to  eq(User.bcrypt('aaaaaaaaa'))
  end
end 