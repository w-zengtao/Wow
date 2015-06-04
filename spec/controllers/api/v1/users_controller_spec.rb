require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "GET 'index'" do
    it "returns a successful 200 response" do
      get :index
      
      expect(response).to be_success
    end

    it "returns all the users" do 
      User.destroy_all
      
      FactoryGirl.create_list(:user, 5)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response.length).to eq(5)
    end
  end

  describe "GET 'show'" do
    User.destroy_all
    user = FactoryGirl.create(:user) 
    
    it "returns a 200 response" do 
      get :show, id: user.id
      
      expect(response).to be_success
    end

    it "returns data of a single user" do 
      get :show, id: user.id 
      parsed_response = JSON.parse(response.body)      
      
      expect(parsed_response).to_not be_nil
    end

    it "returns an status if the user not exist" do 
      get :show, id: 1
      parsed_response = JSON.parse(response.body)
      
      expect(parsed_response['error']).to eq("Does not exist")
      expect(response).to be_not_found
    end

    describe "POST 'create'" do 
      it "should increase User's count" do 
        count = User.count
        post :create, { user: { email: "rspec@test.com", encrypted_password: "aaaaaaa", nickname: "nick"} }
        
        expect(response).to be_success
        expect(User.count).to eq(count + 1)
      end
    end

    describe "DELETE 'delete'" do 
      it "should decrease User's count" do
        count, user = User.count, User.first
        delete :destroy, id: user.id

        expect(User.count).to eq(count - 1)
      end
    end
  end
end
