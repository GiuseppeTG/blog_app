require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
  path '/api/v1/users/{id}' do
    get 'Retrives a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'User found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo: { type: :string },
                 email: { type: :string },
                 bio: { type: :string },
                 posts_counter: { type: :integer },
                 role: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]

        let(:id) { User.create(name: 'foo', email: 'bar@gmail.com', photo_url: 'http://example.com/avatar.jpg', role: 'user', bio: 'some bio').id }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
