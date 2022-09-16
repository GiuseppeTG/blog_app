require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Giuseppe', photo: 'photo url', bio: 'This should be a longer text', posts_counter: 0)
  @user2 = User.create(name: 'Juan', photo: 'photo url', bio: 'This should be a longer text', posts_counter: 0)
  post = Post.create(author: user, title: 'Post title', text: 'This is a post', comments_counter: 0, likes_counter: 0)
  subject { Like.create(post: post, author: @user2) }

  it 'Update likes counter' do
    expect(subject.send(:update_likes_counter)).to eq(true)
  end
end
