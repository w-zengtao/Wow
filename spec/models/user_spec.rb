require 'rails_helper'

RSpec.describe User, :type => :model do

  # let(:user) { User.create!(email: "test@gmail.com", encrypted_password: 'Xfafdsgsdgsddsg') }
  # subject { user }

  it "should create auth_token auto" do
    u  = User.create!(email: "test@gmail.com", encrypted_password: 'Xfafdsgsdgsddsg')
    expect(u.auth_token).not_to be_nil
    u.destroy!
  end
end 