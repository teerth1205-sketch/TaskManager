Rails.application.routes.draw do
  root "dashboard#index"
  
  get 'login', to: "sessions#new", as: 'new_session'
  post 'login', to: "sessions#create", as: 'create_session'
  delete 'logout', to: "sessions#destroy", as: 'destroy_session'

  resources :users
  resources :tasks, only: [:index, :new, :create]
  resources :projects do
    # nested resource for posts
    get '/add_user', to: "projects#search_users", as: "search_users"
    post '/add_user/:id', to: "projects#add_user", as: "add_user"
    resources :tasks, shallow: true
  end
  get '/auth/facebook/callback' => 'sessions#create'
  patch '/taskcomplete/:id', to: "tasks#complete", as: "complete_task"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
