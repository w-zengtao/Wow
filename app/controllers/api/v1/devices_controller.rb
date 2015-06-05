class Api::V1::DevicesController < Api::V1::BaseController
  respond_to :json

  before_action :authenticate_user_from_token!

  def create
    
  end
end
