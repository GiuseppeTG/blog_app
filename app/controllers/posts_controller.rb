class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    author = current_user
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = author

    if post.save
      redirect_to user_url(author)
    else
      render :new, locals: { post: post }
    end
  end
end
