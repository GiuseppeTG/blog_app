class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { minimum: 1, maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_posts_counter
  after_destroy :substract_posts_counter

  def show_recent_comments
    comments.order(updated_at: :desc).first(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def substract_posts_counter
    author.decrement!(:posts_counter)
  end
end
