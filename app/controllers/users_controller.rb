class UsersController < ApplicationController
  before_action :authenticate_user!
  user_signed_in?
  current_user
  user_session

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user.show_recent_posts
  end
end
