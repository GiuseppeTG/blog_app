class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def show_recent_comments
    comments.order('created_at DESC').limit(5)
  end

  def update_posts_counter
    user.posts_counter = user.posts.length
  end

end