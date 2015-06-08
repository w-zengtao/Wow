class Api::V1::PostsController < Api::V1::BaseController

  respond_to :json

  before_action :authenticate_user_from_token!, only: [:update, :destroy, :create, :user_posts, :dis_posts]
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    render json: @posts
  end

  def user_posts
    @user = User.find_by(id: params[:user_id])

    # 查看用户所有的posts
    if @user
      @posts = @user.posts
      render json: @posts, status: 200
    else
      render json: { error: "user(id = #{params[:user_id]}) not found" , status:404 } 
    end
  end

  def dis_posts
    dis = params[:distance].to_i
    @locations = self.location.locations_by_dis dis

    @locations.each do |location|
      @posts << location.posts
    end

    render json: @posts
  end

  def show
    if @post
      render json: @post, status: 200
    else
      render json: { error: "Does not exist" , status: 404 }
    end
  end

  def create

    lon = params[:post][:location][:x]
    lat = params[:post][:location][:y]
    @location = Location.find_or_create_by( lonlat: "POINT(#{lon} #{lat})")

    if @location.blank?
      return render json: { error: 'location not found or created'}
    end

    @post = @location.posts.build(post_params)

    if @post.save
      render json: @post, status: 201
      current_user.post_ids << @post.id
      current_user.save!
    else 
      render json: @post.errors, status: 400
    end

  ensure
    clean_tempfile
  end

  # 必须是当前用户自己的post
  def update
    tag = current_user.post_ids.include?(@post.id)
    if tag
      if @post.update(post_params)
        render json: @post, status: 201
      else
        render json: @post.errors, status: 400
      end
    else 
      render json: { error: "You can only update your post" }
    end
  end

  # 需要从current_user.post_ids 里面清除
  def destroy
    current_user.post_ids.delete_if {|id| id == @post.id }
    current_user.save!
    @post.destroy
    render json: @post, status: 204
  end

  private
  def set_post
    @post = Post.find_by(id: params[:id])
  end
  
  def post_params
    _params.require(:post).permit(:content ,:photo, :position)
    _params[:post][:photo] = parse_image_data(_params[:post][:photo]) if _params[:post][:photo]
    _params
  end
end
