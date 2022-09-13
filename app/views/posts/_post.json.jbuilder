json.extract! post, :id, :title, :text, :comments_counter, :likes_counter, :created_at, :updated_at
json.url post_url(post, format: :json)
