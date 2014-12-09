class HomeController < ActionController::Base

	def index
		@Happers = User.all
		@Happs = Post.all
		@user = current_user
	end

end
