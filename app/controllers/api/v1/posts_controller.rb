class Api::V1::PostsController < Api::V1::ApplicationController
  def index
    posts = Post.where(author_id: params[:user_id])
    render json: { status: 'SUCCESS', message: 'Loaded posts', data: posts }, status: :ok
  end

  def show
    post = Post.where(id: params[:id])
    render json: { status: 'SUCCESS', message: 'Loaded Post', data: post }, status: :ok
  end
end
