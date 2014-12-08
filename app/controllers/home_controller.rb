class HomeController < ActionController::Base

	def index
		@Happers = User.all
		@Happs = Post.all
	end

end
