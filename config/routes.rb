Rails.application.routes.draw do
  root "users#new"
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :users do
    resources :tasks, only: [:index, :create, :new]
  end
  
  resources :projects do
    # nested resource for posts
    resources :tasks, shallow: true
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
