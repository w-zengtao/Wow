require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do

  describe "GET 'index'" do 
    it "returns a 200 response" do 
      get :index

      expect(response).to be_success
    end

    it "should return all the posts" do 
      Post.destroy_all

      FactoryGirl.create_list(:post, 5)
      get :index
      parsed_response = JSON.parse(response.body)

      expect(parsed_response.length).to eq(5)
    end
  end

  describe "POST 'create'" do
    it "should increase Post's count" do 
      count = Post.count
      User.destroy_all
      user = FactoryGirl.create(:user)
      post :create, { post: { content: "post content ", position: "post position", photo: "post photo", location: { x: 1.1111111, y: 1.1111111 } }, token: User.first.auth_token }
    
      expect(count).to eq(Post.count - 1)
    end
  end

  describe "DELETE 'destroy'" do 
    it "should decrease Post's count" do 
      FactoryGirl.create(:post)
      count = Post.count 
      delete :destroy, {id: Post.first.id, token: User.first.auth_token }

      expect(count).to eq(Post.count + 1)
    end
  end
end
