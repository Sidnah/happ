class HomeController < ActionController::Base

	def index

		if current_user

			@users = User.all
			@posts = Post.all
			@user = current_user

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

		else
			redirect_to user_session_path	
		end
	
	end

end
