class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize do |post|
    post.likes_counter = 0
    post.comments_counter = 0
  end

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def show_recent_comments
    comments.order(updated_at: :desc).first(5)
  end
end
