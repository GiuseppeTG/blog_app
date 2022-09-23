class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Could not create the comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
