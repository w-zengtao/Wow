class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  # 认证咯 所有需要登录处理的API必须通过这个认证 先Mark在这里 TODO sign_in
  def authenticate_user_from_token!
    token = params[:token].presence
    user = token && User.find_by_auth_token(token)

    if user
      sign_in user, store: false
    end
  end
end
