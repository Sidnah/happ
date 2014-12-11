class HomeController < ActionController::Base

	def index

		

		if current_user

			@Happers = User.all
		@Happs = Post.all
		@user = current_user

		
		
		else
			redirect_to user_session_path
		
	end

		
	end

end
