require 'rails_helper'

RSpec.describe 'In the users index page', type: :system do
  before(:each) do
    @user1 = User.create(name: 'AsheTest',
                         photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Ashe_9.jpg',
                         bio: 'I am a boring adc.')

    @user2 = User.create(name: 'TeemoTest',
                         photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Teemo_25.jpg',
                         bio: 'I place mushrooms everywhere')

    @user3 = User.create(name: 'JinxTest',
                         photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_37.jpg',
                         bio: 'I am a boring adc.')
  end

  scenario 'I can see the username of all other users.' do
    visit '/users'
    expect(page).to have_content('Ashe')
    expect(page).to have_content('Teemo')
    expect(page).to have_content('Jinx')
  end

  scenario 'I can see the username of all other users.' do
    visit '/users'
    expect(page).to have_xpath("//img[@src='#{@user1.photo}']")
    expect(page).to have_xpath("//img[@src='#{@user2.photo}']")
    expect(page).to have_xpath("//img[@src='#{@user3.photo}']")
  end

  scenario 'I can see the number of posts each user has written.' do
    visit '/users'
    expect(page).to have_content("Posts: #{@user1.posts_counter}")
    expect(page).to have_content("Posts: #{@user1.posts_counter}")
    expect(page).to have_content("Posts: #{@user1.posts_counter}")
  end

  scenario 'When I click on an user.' do
    visit '/users'
    click_link @user1.name
    expect(page).to have_current_path(user_path(@user1))
    visit '/users'
    click_link @user2.name
    expect(page).to have_current_path(user_path(@user2))
    visit '/users'
    click_link @user3.name
    expect(page).to have_current_path(user_path(@user3))
  end
end
