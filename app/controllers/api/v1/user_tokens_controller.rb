class Api::V1::UserTokensController < Api::V1::BaseController
  respond_to :json


  def create
    user = User.find_by(email: params[:user][:email])
    return render json: { error: "user not found", status: 404 } unless user

    # 校验用户密码
    e_password = User.bcrypt(params[:user][:encrypted_password])
    return render json: { error: "password error", status: 401 } unless (e_password == user.encrypted_password)

    render json: { user_token: { auth_token: user.auth_token, id: user.id } }
  end

  def destroy
    #TODO 
  end
end
