Rails.application.routes.draw do


  resources :entities
  resources :prices
  get 'pages/about'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
