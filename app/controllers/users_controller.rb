class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id])
  	@users = User.all
	@happs = @user.posts
  end

end