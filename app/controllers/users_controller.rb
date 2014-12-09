class UsersController < ApplicationController
#before_filter :authenticate_user!

  def show
  	@happer = User.find(params[:id])
	@happs = @happer.posts
  end
end