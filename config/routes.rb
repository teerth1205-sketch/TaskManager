Rails.application.routes.draw do


  resources :users do
    resources :tasks, only: [:index]
  end
  
  resources :projects do
    # nested resource for posts
    resources :tasks, shallow: true
  end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
