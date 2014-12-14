class PostsController < ApplicationController

  def index
  	@posts = Post.all
    @posts = @posts.reverse
    @user = current_user

    if params[:search]
      @articles = Post.search(params[:search]).order("created_at DESC")
    else
      @articles = Post.order("created_at DESC")
    end


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
    session[:return_to] ||= request.referer
    @post = Post.new(happ_params)
    @post.user_id = current_user.id;
    @post.save

    @feed_items = []
    
    redirect_to @post

  end

  def delete
    if current_user.nil?
      redirect_to root_path
    else
      session[:return_to] ||= request.referer
      @posts = Post.all
      @post = Post.find(params[:id])
      if current_user.id != @post.user_id
        redirect_to root_path
      else
        @post.destroy
        redirect_to session.delete(:return_to)
      end
    end
  end

  private
    def happ_params
      params.require(:post).permit(:text)
    end

end
