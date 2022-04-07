Rails.application.routes.draw do
  get "/home", to: "pages#home"
  get "/contact", to: "pages#contact"
  get "/about", to: "pages#about"
  get "/privacy", to: "pages#privacy"

  root to: "pages#home"
end


