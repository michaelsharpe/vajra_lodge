VajraLodge::Application.routes.draw do
  root to: 'sessions#new'
  get 'login' => 'sessions#new', :as => :login
  post 'logout' => 'sessions#destroy', :as => :logout
  get 'feed' => 'posts#index', :as => :feed
  post 'users/:id/disable' => 'users#disable', :as => :disable
  post 'users/:id/enable' => 'users#enable', :as => :enable
  post 'users/:id/admin' => 'users#admin', :as => :admin
  post 'minutes/:id/reviewed' => 'minutes#reviewed', :as => :reviewed
  post 'minutes/:id/not_reviewed' => 'minutes#not_reviewed', :as => :not_reviewed

  resources :users, :except => [:destroy] do
    resources :profiles, :except => [:index, :new, :create, :show, :destroy]
    resources :milestones, :except => :destroy
  end
  resources :minutes, :except => [:destroy]
  resources :posts do
    resources :comments, :except => [:index]    
  end
  resources :sessions, only: [:new, :create, :destroy]


end
