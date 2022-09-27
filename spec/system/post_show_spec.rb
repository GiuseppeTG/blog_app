require 'rails_helper'

RSpec.describe 'Posts show', type: :feature do
  before(:each) do
    @user = User.find_by(id: 1)
    @post = Post.find_by(id: 1)
    @comment = Comment.find_by(id: 3)
    @commentor = User.find_by(id: @comment.author_id)
    visit user_post_path(@user, @post)
  end

  scenario 'Display post info' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Comments: #{@post.comments_counter}")
    expect(page).to have_content("Likes: #{@post.likes_counter}")
    expect(page).to have_content(@post.text)
  end

  scenario 'See commentator info' do
    expect(page).to have_content(@commentor.name)
    expect(page).to have_content(@comment.text)
  end
end
