Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions"
  }
  get "/home", to: "pages#home"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/articles", to: "pages#articles"
  post '/create_contact', to: 'pages#create_contact'

  namespace :dashboard do
    get '/home', to: 'pages#home'
    root to: 'pages#home'
    resources :treatments
  end

  root to: "pages#home"

end


