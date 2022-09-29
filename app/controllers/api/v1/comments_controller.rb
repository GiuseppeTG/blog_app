class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    comments = Comment.where(post_id: params[:post_id])
    render json: { status: 'SUCCESS', message: 'Loaded comments', data: comments }, status: :ok
  end

  def create
    p params
    comment = Comment.new(comment_params)

    if comment.save
      render json: { status: 'SUCCESS', message: 'Saved comment', data: comment }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Comment not saved', data: comment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], author: User.first)
  end
end
