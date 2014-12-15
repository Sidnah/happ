class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def show
  	@user = User.find(params[:id])
  	@users = User.all
    @posts = @user.posts

    @hashtags_array = []
		@feed_items = current_user.feed

		hashtags = Post.all
		hashtags = hashtags.each do |happ|
			happ.text = happ.text.scan(/(?:(?<=\s)|^)#(\w*[A-Za-z_]+\w*)/)
			happ.text.each do |l|
				@hashtags_array.push(l[0])
			end
		end

		@hashtags_hash = @hashtags_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
		@sorted_hashtags = Hash[@hashtags_hash.sort_by{|k, v| v}.reverse]

  end

  def user_params
  	params.require(:user).permit(:picture)
  end

  def following
  	@title = "Following"
    @user  = User.find(params[:id])
    @all =  User.where.not(id: current_user.id)
    @users = @user.following
    render 'show_follow'
  end

  def followers
  	@title = "Followers"
    @user  = User.find(params[:id])
    @all =  User.where.not(id: current_user.id)
    @users = @user.followers
    render 'show_follow'
  end

end