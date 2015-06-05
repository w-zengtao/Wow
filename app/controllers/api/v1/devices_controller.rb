class Api::V1::DevicesController < Api::V1::BaseController
  respond_to :json

  before_action :authenticate_user_from_token!

  def create

    if params[:device][:device_token].blank?
      return render json: { error: "you'd have a device_token", status: 400 }
    end
    
    @device = current_user.devices.new(device_params)

    if @device.save
      render json: @device, status: 201
    else
      render json: @device.errors, status: 400
    end

  end


  private

  def device_params
    params.require(:device).permit(:os, :version, :device_token)
  end
end
