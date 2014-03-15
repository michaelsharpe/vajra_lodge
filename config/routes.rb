VajraLodge::Application.routes.draw do
  root to: 'users#index'
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
  get 'feed' => 'posts#index', :as => :feed
  

  resources :users
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]


end
