class HomeController < ActionController::Base

	def index

		if current_user

			@users = User.all
			@posts = Post.all
			@user = current_user
			@feed_items = current_user.feed
			
			else
				redirect_to user_session_path	
		end
	
	end

end
