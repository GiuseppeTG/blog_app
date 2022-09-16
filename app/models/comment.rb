class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, length: { minimum: 1 }

  def update_comments_counter
    post.comments_counter = post.comments.length
  end
end
