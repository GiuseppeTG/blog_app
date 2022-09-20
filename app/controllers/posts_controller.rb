class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @params = params
  end
end
