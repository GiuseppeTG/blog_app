require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
  path '/api/v1/users/{id}/posts' do
    get 'Retrives posts' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Posts found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 text: { type: :string },
                 comment_counter: { type: :integer },
                 likes_counter: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer }
               },
               required: %w[id]

        let(:author_id) { User.create(name: 'foo', email: 'bar@gmail.com', photo_url: 'http://example.com/avatar.jpg', role: 'user', bio: 'some bio').id }
        let(:id) { Post.create(title: 'foo', text: 'bar', author_id: author_id).id }
        run_test!
      end

      response '404', 'Posts not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
