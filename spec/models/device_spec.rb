require 'rails_helper'
      # t.string :os
      # t.string :version
      # t.string :device_token

RSpec.describe Device, type: :model do
  before do 
    @device = Device.create!(os: "os", version: "version", device_token: "device_token")
  end

  subject { @device }

  it { should respond_to(:os) }
  it { should respond_to(:version) }
  it { should respond_to(:device_token) }

  describe "device_token can't be nil" do 
    before { @device.device_token = '' }

    it { should_not be_valid }
  end
end
