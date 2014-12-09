class PostsController < ApplicationController

  def index
  	@Happs = Post.all
    @user = current_user
  end

   def show
   	@happ = Post.find(params[:id])
   	if @happ == false
   		render :status => 404
   	end
   end

  # def create
  #   @happ = Post.new(post_params)
  #   @happ.save
  #   redirect_to "/posts"
  #   if @happ.user_id == nil
  #     response.body = "User can&#39;t be blank"
  #   end
    
  # end

  def new
    @users = User.all
    @logged = current_user
  end

  def create
    @happ = Post.new(happ_params)
    @happ.user_id = current_user.id;
   
    @happ.save
    redirect_to @happ
  end

  def delete
      @happs = Post.all
      @happ = Post.find(params[:id])
      @happ.destroy
      redirect_to root_path
  end

  private
    def happ_params
      # :user_id = current_user.id
      params.require(:post).permit(:text)
    end

end
