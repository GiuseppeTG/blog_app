require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Giusepost',
                     photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
                     bio: 'This should be a longer text',
                     posts_counter: 0)

  user2 = User.create(name: 'Juanlike',
                      photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
                      bio: 'This should be a longer text',
                      posts_counter: 0)

  post = Post.create(author: user, title: 'Post title', text: 'This is a post', comments_counter: 0, likes_counter: 0)
  Like.create(post: post, author: user2)

  it 'Update likes counter' do
    expect(post.likes_counter).to eq(1)
  end
end
