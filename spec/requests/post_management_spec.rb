require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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

RSpec.describe 'Post management', type: :request do
  it "Redirects to the posts's page" do
    get '/users/7/posts'
    expect(response).to render_template(:index)
  end

  it 'Redirects to the specific post page' do
    get '/users/7/posts/1'
    expect(response).to render_template(:show)
  end

  describe 'Posts view' do
    it 'Has a post related heading' do
      get '/users/7/posts'
      expect(response.body).to include('A list of posts')
    end
  end

  describe 'Specific post view' do
    it 'Has a post related heading' do
      get '/users/7/posts/1'
      expect(response.body).to include('A specific post')
    end
  end
end
