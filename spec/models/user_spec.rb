require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @subject = User.create(name: 'Giuseppe',
                           photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
                           bio: 'This should be a longer text',
                           posts_counter: 0)
  end

  it 'User must have a name' do
    @subject.name = nil
    expect(@subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero.' do
    @subject.posts_counter = -2
    expect(@subject).to_not be_valid
  end

  it 'Show recent posts method' do
    10.times { @subject.posts.create(title: 'title', text: 'This is a post', comments_counter: 10, likes_counter: 2) }
    expect(@subject.show_recent_posts.count).to eq(3)
  end
end
