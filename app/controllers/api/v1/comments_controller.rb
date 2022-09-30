class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    comments = Comment.where(post_id: params[:post_id])
    render json: comments, status: :ok
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment, status: :ok
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], author: User.first)
  end
end
