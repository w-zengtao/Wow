require 'rails_helper'

RSpec.describe "routing to tokens", :type => :routing do
  
  it "routes tokens create" do 
    expect(:post => "/api/v1/user_tokens").to route_to(
      :controller => "api/v1/user_tokens",
      :action => "create"
      )
  end
  
  it "routes tokens destroy" do 
    expect(:delete => "/api/v1/user_tokens/:id").to route_to(
      :controller => "api/v1/user_tokens",
      :action => "destroy",
      :id => ":id"
      )
  end
end