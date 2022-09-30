class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    users = User.order('id ASC')
    render json: users, status: :ok
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user, status: :ok
  end
end
