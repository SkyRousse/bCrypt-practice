Rails.application.routes.draw do
  root to: 'posts#index'
  resources :logins, :only => [:new, :create, :destroy]
  resources :users do
    resources :posts, :only => [:show]
  end
  resources :posts
end
