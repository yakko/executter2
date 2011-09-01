class MobileController < ApplicationController
  layout 'application_mobile'

  before_filter :must_login, :except=>[:login, :post_login]

  before_filter do
    @mobile = true
  end
  
  def login
  end

  def post_login
    render :login
  end
=begin
  def index
  end

=end
  def index_posts
    @posts = Post.from_relation(current_user, :followings, {:before => params[:before]})
  end

  def index_mentions
    @posts = Post.from_search(cu_ro.u_, {:before => params[:before]})
  end


  
  def index_new_post
    @post = current_user.posts.create :remote_ip  => request.remote_ip,
                                      :body       => params[:body]
    User.update(cu_ro.id, :last_read_post_id => @post.id) if @post
    redirect_to :action => :index_posts
  end

  def user
    if params[:user_id]||params[:id]
      @user = current_user if (current_user && current_user.id == params[:user_id]||params[:id])
      @user ||= User.find(params[:user_id]||params[:id])
    elsif params[:username]
      @user = current_user if (current_user && current_user.username.downcase == params[:username].downcase)
      @user ||= User.findu(params[:username])
    elsif current_user
      @user = current_user
    end
    
    @posts = Post.from_profile(@user, :before => params[:before])
  end

  def user_posts
  end

  def post
  end

  def post_posts
  end

  def post_posts_new
  end

  def city
  end

  def city_posts
  end

end
