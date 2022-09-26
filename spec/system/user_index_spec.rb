require 'rails_helper'

RSpec.describe 'In the users index page', type: :system do
  u = User.create(name: 'Jinx', photo: 'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_37.jpg',
                  bio: 'I am a boring adc.')
  it 'I can see the username of all other users.' do
    visit '/users'
    sleep(10)
    expect(page).to have_content(u.name)
  end
end
