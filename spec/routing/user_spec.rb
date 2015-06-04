require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
  # before { @user = User.create!(email: "test@gmail.com", encrypted_password: 'aaaaaaaaa') }
  
  it "routes users index" do 

    expect(:get => "/api/v1/users").to route_to(
        :controller => "api/v1/users",
        :action => "index"
      )
  end

  it "routes users show" do 
    expect(:get => "/api/v1/users/:id").to route_to(
        :controller => "api/v1/users",
        :action => "show",
        :id => ":id"
      )
  end
end