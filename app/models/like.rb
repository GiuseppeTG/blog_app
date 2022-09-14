class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_likes_counter
    post.likes_counter = post.likes.length
  end
end