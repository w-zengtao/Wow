class Api::V1::PostsController < ApplicationController

  respond_to :json

  def index
    @posts = Post.all

    render json: @posts
  end

  def create
    @location = Location.find_or_create_by!( position: POINT(params[:post][:location][:x].to_f,  params[:post][:location][:y].to_f))

  end

  private

  def post_params
    params.require(:post).permit(:content ,:photo, :position, location: [:x, :y])
  end
end
