require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Giuseppe',
      photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
      bio: 'A bio',
      posts_counter: 0
    )

    @subject = Post.create(
      author: @user,
      title: 'Post title',
      text: 'A large text',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  it 'Post must have a title' do
    @subject.title = nil
    expect(@subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    @subject.title = 'a' * 300
    expect(@subject).to_not be_valid
  end

  it 'Comments counter must be an integer greater than or equal to zero' do
    @subject.comments_counter = -3
    expect(@subject).to_not be_valid
  end

  it 'Likes counter must be an integer greater than or equal to zero.' do
    @subject.likes_counter = -10
    expect(@subject).to_not be_valid
  end

  it 'Show recent comments method' do
    expect(@subject.comments_counter).to be_an_integer
  end

  it 'Show recent comments method' do
    10.times { @subject.comments.create(text: 'Comment', author: @user) }
    expect(@subject.show_recent_comments.count).to eq(5)
  end
end
