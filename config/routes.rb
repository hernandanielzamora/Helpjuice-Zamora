Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users do
    resources :posts, only: [:index, :show, :new, :create, :destroy] 
  end
end
