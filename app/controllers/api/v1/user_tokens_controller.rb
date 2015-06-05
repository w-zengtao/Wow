class Api::V1::UserTokensController < Api::V1::BaseController
  respond_to :json


  def create
    # 通过邮箱查找用户 TODO 所有邮箱before_save downcase一下
    user = User.find_by(email: params[:user][:email].downcase)
    return render json: { error: "user not found", status: 404 } unless user

    # 校验用户密码
    e_password = User.bcrypt(params[:user][:encrypted_password])
    return render json: { error: "password error", status: 401 } unless (e_password == user.encrypted_password)

    #TODO 要登录用户
    render json: { user_token: { auth_token: user.auth_token, id: user.id } }
  end
end
