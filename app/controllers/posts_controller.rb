class PostsController < ApplicationController

  def index
  	@posts = Post.all
    @posts = @posts.reverse
    @users = User.all
    @user = current_user

    if params[:search]
      @happs = Post.search(params[:search]).order("created_at DESC")
    else
      @happs = Post.order("created_at DESC")
    end

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

   def show
   	@post = Post.find(params[:id])
   	if @post == false
   		render :status => 404
   	end
   end

  def new
    @users = User.all
    @logged = current_user
  end

  def create
    @posts = Post.all
    session[:return_to] ||= request.referer
    @post = Post.new(happ_params)
    @post.user_id = current_user.id;
    @post.save

    @feed_items = []
    
    redirect_to root_path

  end

  def delete
    if current_user.nil?
      redirect_to root_path
    else
      session[:return_to] ||= request.referer
      @posts = Post.all
      @post = Post.find(params[:id])
      if current_user.id != @post.user_id
        redirect_to root_path
      else
        @post.destroy
        redirect_to session.delete(:return_to)
      end
    end
  end

  private
    def happ_params
      params.require(:post).permit(:text)
    end

end
