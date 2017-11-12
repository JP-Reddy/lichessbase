Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"

  }
  resources :games
  root 'games#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
