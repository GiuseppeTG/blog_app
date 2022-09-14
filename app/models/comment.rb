class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_comments_counter
    post.comments_counter = post.comments.length
  end
end