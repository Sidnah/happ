class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@users = User.all
	@posts = @user.posts
	@posts = @posts.reverse
  end

  def user_params
  	params.require(:user).permit(:picture)
  end

end