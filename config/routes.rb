Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/contact'
  get 'pages/about'
  get 'pages/privacy'
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
