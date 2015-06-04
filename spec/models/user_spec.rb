require 'rails_helper'

RSpec.describe User, :type => :model do

  before { @user = User.create!(email: "test@gmail.com", encrypted_password: 'aaaaaaaaa') }
  subject { @user }

  it { should respond_to(:email)}
  it { should respond_to(:encrypted_password)}
  it { should be_valid }

  it "should create auth_token auto" do
    expect(@user.auth_token).not_to be_nil
  end

  it "should encrypted_password" do 
    expect(@user.encrypted_password).not_to be 'aaaaaaaaa'
  end

  it "encrypted_password should be" do
    expect(@user.encrypted_password).to  eq(User.bcrypt('aaaaaaaaa'))
  end

  describe "email must be present" do 
    before { @user.email = ''}

    it { should_not be_valid }
  end

  describe "email format must be valid" do
    it "should be invalid" do 
      email_addes = %w[user@abc,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      email_addes.each do |add|
        @user.email = add
        expect(@user).not_to be_valid
      end
    end
  end

  describe "email format is valid" do 
    it "should be valid" do 
      email_addes = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      email_addes.each do |add|
        @user.email = add
        expect(@user).to be_valid
      end
    end
  end

end 