class Api::V1::UsersController < Api::V1::BaseController

  respond_to :json

  before_action :set_user, only: [:show, :update, :destroy]

  # GET
  def index
    @users = User.all
    render json: @users
  end

  # GET
  def show
    if @user
      render json: @user, status: 200
    else
      render json: { error: "Does not exist" }, status: 404
    end
  end

  # POST
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: 201
    else 
      render json: @user.errors, status: 400
    end
  end

  # PATCH/PUT
  def update
    if @user.update(user_params)
      render json: @user, status: 201
    else
      render json: @user.errors, status: 400
    end
  end

  # DELETE
  def destroy
    @user.destroy
    render json: @user, status: 204
  end

  private
  def set_user
    @user = User.find_by(id: params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :encrypted_password, :nickname)
  end

end