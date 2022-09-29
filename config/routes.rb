Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[index new create show destroy]
      resources :likes, only: [:create]
    end
  end

  #  API ROUTES

  namespace :api do # /api
    namespace :v1 do # /api/v1
      resources :users, only: %i[index show] do # api/v1/users
        resources :posts, only: %i[index show], format: :json do # api/v1/users/:user_id/posts
          resources :comments, only: %i[index show create], format: :json # api/v1/users/:user_id/posts/:post_id/comments
        end
      end
    end
  end
end
