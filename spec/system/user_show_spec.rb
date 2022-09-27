require 'rails_helper'

RSpec.describe 'In the users show page', type: :system do
  before(:each) do
    @user1 = User.find_by(id: 1)
    @post2 = Post.find_by(id: 2)
  end

  scenario "I can see the user's profile picture, username, number of posts and bio" do
    visit user_path(@user1)
    expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    expect(page).to have_text(@user1.name)
    expect(page).to have_text(/posts: #{@user1.posts_counter}/i)
    expect(page).to have_text(@user1.bio)
  end

  scenario 'I can see the user posts title and text' do
    visit user_path(@user1)
    @user1.show_recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end
  end

  scenario 'I can see the user posts title and text' do
    visit user_path(@user1)
    expect(page).to have_link('See all posts')
  end

  scenario 'Redirect to post index page' do
    visit user_path(@user1)
    click_link 'See all post'
    expect(page).to have_current_path(user_posts_path(@user1))
  end

  scenario 'Redirects to post show page' do
    visit user_path(@user1)
    click_on(@post2.title)
    expect(current_path).to eq("/users/#{@user1.id}/posts/20")
  end
end
