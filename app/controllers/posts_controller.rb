class PostsController < ApplicationController

	@happ

  def index
  	@Happs = Post.all
    @user = current_user
  end

  def new
  	@users = User.all
  	@happ = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  	if @post.published == false
  		render :status => 404
  	end
  end

  def create
    @happ = Post.new(post_params)
    @happ.save
    redirect_to "/posts"
    if @happ.user_id == nil
      response.body = "User can&#39;t be blank"
    end
    
  end

  def post_params
    params.require(:post).permit(:user_id, :message)
  end

end
