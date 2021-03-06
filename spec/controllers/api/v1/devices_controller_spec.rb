require 'rails_helper'

RSpec.describe Api::V1::DevicesController, type: :controller do
  describe "POST 'create'" do 
    it "should not create without an invalid auth_token" do 
      post :create, device: { token: 'invalid', os: "os", version: "version", device_token: "device_token" }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['error']).to eq("you'd have a auth_token")
      expect(parsed_response['status']).to eq(401)
    end

    it "should not crate without an device_token" do 
      user = FactoryGirl.create(:user) 
      post :create, { device: { os: "os", version: "version", device_token: "" }, token: User.first.auth_token }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response['error']).to eq("you'd have a device_token")
      expect(parsed_response['status']).to eq(400)
    end

    it "should increase device's size" do 
      user = FactoryGirl.create(:user)
      count = Device.count
      post :create, { device: { os: "os", version: "version", device_token: "device_token" }, token: user.auth_token }
    
      expect(count).to eq(Device.count - 1)
    end
  end

end
