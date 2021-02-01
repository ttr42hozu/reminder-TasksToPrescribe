Rails.application.routes.draw do
  devise_for :users
  root to: 'patients#index'
  resources :patients, only: [:index, :new, :create] do
    resources :preparations, only: [:create, :destroy]
  end
end
