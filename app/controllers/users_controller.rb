class UsersController < ApplicationController


  def show
  	@user = User.find(params[:id])
	@happs = @user.posts
  end

end