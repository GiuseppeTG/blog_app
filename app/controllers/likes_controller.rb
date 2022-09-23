class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    author = current_user
    like = Like.new(params.permit(:author, :post))
    like.author = author
    like.post = post

    if like.save
      flash[:success] = 'You liked this post :)'
      redirect_to user_post_path(post[:author_id], post)
    else
      flash.now[:error] = 'Error: Did not like ):'
    end
  end
end
