require 'swagger_helper'

RSpec.describe 'Blog API', type: :request do
  path '/api/v1/users/{id}/posts/{id}/comments' do
    get 'Retrives comments' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Comments found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 author_id: { type: :integer },
                 post_id: { type: :integer }
               },
               required: %w[id]

        let(:author_id) { User.create(name: 'foo', email: 'bar@gmail.com', photo_url: 'http://example.com/avatar.jpg', role: 'user', bio: 'some bio').id }
        let(:post_id) { Post.create(title: 'foo', text: 'bar', author_id: author_id).id }
        let(:id) { Comment.create(text: 'foo').id }
        run_test!
      end

      response '404', 'Posts not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    post 'Post a comment' do
      tags 'Comment'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'Comments created' do
        schema type: :object,
               properties: {

                 text: { type: :string }

               },
               required: %w[id]

        let(:author_id) { User.create(name: 'foo', email: 'bar@gmail.com', photo_url: 'http://example.com/avatar.jpg', role: 'user', bio: 'some bio').id }
        let(:post_id) { Post.create(title: 'foo', text: 'bar', author_id: author_id).id }
        let(:id) { Comment.create(text: 'foo').id }
        run_test!
      end

      response '404', 'Comment not created' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
