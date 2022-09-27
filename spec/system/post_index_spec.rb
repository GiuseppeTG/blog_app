require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before :each do
    @user = User.find_by(id: 1)
    @post = Post.find_by(id: 2)
    visit user_posts_path(@user)
  end

  scenario 'Display user info' do
    expect(page).to have_content(@user.name)
    expect(page).to have_xpath("//img[@src='#{@user.photo}']")
    expect(page).to have_content(@user.posts_counter.to_s)
  end

  scenario 'Display a post title' do
    expect(page).to have_content(@post.title)
  end

  scenario 'Display a post body' do
    expect(page).to have_content(@post.text)
  end

  scenario 'Displays the first comments in a post' do
    comments = @post.comments
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  scenario 'Displays the number of comments in a post' do
    expect(page).to have_content(@post.comments_counter)
  end

  scenario 'Displays the number of likes in a post' do
    expect(page).to have_content(@post.likes_counter)
  end

  scenario 'Redirects the user to the post show page' do
    visit user_post_path(@user, @post)
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
  end
end
