require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Giuseppe', photo: 'photo url', bio: 'This should be a longer text', posts_counter: 0)
  post = Post.create(
    author: user,
    title: 'Post title',
    text: 'This is a post',
    comments_counter: 0,
    likes_counter: 3
  )

  subject do
    Comment.create(
      post: post,
      author: user,
      text: 'This is a comment'
    )
  end

  it 'Comment must have a text' do
    subject.text = ''
    expect(subject).to_not be_valid
  end

  it 'Update comments counter method' do
    expect(post.comments_counter).to eq(1)
  end
end
