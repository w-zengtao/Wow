require 'rails_helper'

RSpec.describe Api::V1::UserTokensController, type: :controller do
  describe "POST 'create'" do 
    it "should return error without an right email add" do 
      post :create,  { user: { email: "invalid@test.com", encrypted_password: "aaaaaaa", nickname: "nick"} }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["error"]).to eq("user not found")
      expect(parsed_response["status"]).to eq(404)
    end

    it "should return error without an right password" do 
      User.destroy_all
      user = User.create!(email: "rspec@test.com", encrypted_password: "aaaaaa", nickname: "nick")
      post :create, { user: { email: "rspec@test.com", encrypted_password: "bbbbbb", nickname: "nick"} }

      parsed_response = JSON.parse(response.body)

      expect(parsed_response["error"]).to eq("password error")
      expect(parsed_response["status"]).to eq(401)
    end

    it "should get token with right password" do 
      user = User.create!(email: "rspec@test.com", encrypted_password: "aaaaaa", nickname: "nick")
      post :create, { user: { email: "rspec@test.com", encrypted_password: "aaaaaa", nickname: "nick"} }

      expect(response).to be_success
      
      parsed_response = JSON.parse(response.body)

      puts parsed_response
      expect(parsed_response["user_token"]["auth_token"]).to eq(user.auth_token)
    end
  
  end
end
