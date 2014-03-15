VajraLodge::Application.routes.draw do
  root to: 'sessions#new'
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
  get 'feed' => 'posts#index', :as => :feed
  post 'users/:id/disable' => 'users#disable', :as => :disable
  post 'users/:id/enable' => 'users#enable', :as => :enable

  resources :users, :except => [:destroy]
  resources :posts do
    resources :comments, :except => [:index]    
  end
  resources :sessions, only: [:new, :create, :destroy]


end
