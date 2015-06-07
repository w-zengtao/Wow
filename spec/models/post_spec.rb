require 'rails_helper'

RSpec.describe Post, type: :model do
  before { @post = FactoryGirl.create(:post) }
  subject { @post }

  it { should respond_to(:position) }
  it { should respond_to(:content) }
  it { should respond_to(:photo) }

  it "should belongs_to a location" do
    @location = FactoryGirl.create(:location)

    @location.posts << @post
    expect(@post.location).to be @location
  end 
  
  # it { should belongs_to(:user)} 打算用pg的Array来写这个吧
end
