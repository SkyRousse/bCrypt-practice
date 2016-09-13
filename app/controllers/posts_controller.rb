class PostsController < ApplicationController
  before_action :authenticated_only, only: :new

  def index
    @posts = Post.all
  end

  def new

    @post = Post.new
  end

  def create
    user = User.find(session[:current_user_id])
    @post = Post.create(post_params)
    @post.user = user
    if @post.save
      flash[:notice] = "post created"
      redirect_to user_post_path(user, @post)
    else
      flash[:notice] = "post faileddd"
      render new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
