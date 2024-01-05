class UsersController < ApplicationController
  def index
    @posts = Post.all.includes(:author)
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id]) || not_found
  end
end
