class PostsController < ApplicationController

  def index
  	@posts = Post.all
    @user = current_user
  end

   def show
   	@post = Post.find(params[:id])
   	if @post == false
   		render :status => 404
   	end
   end

  def new
    @users = User.all
    @logged = current_user
  end

  def create
    @post = Post.new(happ_params)
    @post.user_id = current_user.id;
   
    @post.save
    redirect_to @post
  end

  def delete
      @posts = Post.all
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to root_path
  end

  private
    def happ_params
      params.require(:post).permit(:text)
    end

end
