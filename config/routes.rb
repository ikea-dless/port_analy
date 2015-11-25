Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do
    resources :prfiles, except: :show
    resource :activity, except: :show do
      get '/', to: 'activities#index', on: :collection
    end
    resources :activities, only: :show
  end
end
