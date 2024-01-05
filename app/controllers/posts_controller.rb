class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'An error has occurred while creating the post.'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @post.destroy!
    redirect_to user_posts_path(id: @author.id), notice: 'Post deleted!'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end