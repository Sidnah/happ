class UsersController < ApplicationController

	before_filter :authenticate_user!

  def show
  	@user = User.find(params[:id])
	@happs = @user.posts
  end

end