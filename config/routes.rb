Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#index'
  get 'search', to: 'homes#search'
  resources :users, only: [] do
    resource :profile, except: :show do
      get '/', to: 'profiles#index', on: :collection
    end
    resource :activity, except: :show do
      get '/', to: 'activities#index', on: :collection
    end
  end
  resources :activities, only: :show

  namespace :api, format: 'json' do
    resources :activities, only: :show
  end
end
