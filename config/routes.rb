Rails.application.routes.draw do
  devise_for :users
  get "/home", to: "pages#home"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/articles", to: "pages#articles"
  post '/create_contact', to: 'pages#create_contact'


  root to: "pages#home"
end


