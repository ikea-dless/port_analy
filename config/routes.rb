Rails.application.routes.draw do
  devise_for :users

  resources :profiles
  resources :activities
end
