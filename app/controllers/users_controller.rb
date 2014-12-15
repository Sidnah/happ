class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def show
  	@user = User.find(params[:id])
  	@users = User.all
	@posts = @user.posts
	@posts = @posts.reverse
  end

  def user_params
  	params.require(:user).permit(:picture)
  end

  def following
  	@title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.where.not(:id => current_user.id)
    @notfollowed = @user.following.where.not(:id => current_user.id)
    @all = User.where.not(:id => current_user.id).where.not(:id => @notfollowed)
    render 'show_follow'
  end

  def followers
  	@title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.where.not(:id => current_user.id)
    @notfollowed = @user.following.where.not(:id => current_user.id)
    @all = User.where.not(:id => current_user.id).where.not(:id => @notfollowed)
    render 'show_follow'
  end

end