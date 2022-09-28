class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user.show_recent_posts
    @current_user = current_user
  end
end
