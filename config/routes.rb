Rails.application.routes.draw do
  get "/home", to: "pages#home"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/articles", to: "pages#articles"

  root to: "pages#home"
end


