Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token



  resources :entities
  resources :prices
  get 'pages/about'
  match '/chart',   to: 'pages#chart',   via: 'get'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*path' => redirect('/') unless Rails.env.development?
end
