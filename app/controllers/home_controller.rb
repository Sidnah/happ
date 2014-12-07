class HomeController < ActionController::Base

	def index
		@Happers = User.all
	end

end
