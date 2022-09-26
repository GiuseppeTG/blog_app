require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  controller do
    def index
      render json: {}, status: 209
    end
  end

  describe 'Index status' do
    it 'Returns a 209 custom status code' do
      get :index
      expect(response).to have_http_status(209)
    end
  end
end

RSpec.describe 'User management', type: :request do
  it "Redirects to the user's page" do
    get '/users'
    expect(response).to render_template(:index)
  end

  it 'Redirects to the specific user page' do
    get '/users/1'
    expect(response).to render_template(:show)
  end

  describe 'User views' do
    it 'Has a user related heading' do
      get '/users'
      expect(response.body).to include('Users')
    end
  end

  describe 'Specific user views' do
    it 'Has a user related heading' do
      get '/users/1'
      expect(response.body).to include('Return')
    end
  end
end

RSpec.describe 'Users index page', type: :feature do
  scenario 'Can see index page' do
    visit users_path
    expect(page).to have_content('Users')
  end
  scenario 'Can see index page' do
    visit users_path
    expect(page).to have_content('Users')
  end
end
