class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id])
  	@users = User.all
	@posts = @user.posts
  end

end