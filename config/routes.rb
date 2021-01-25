Rails.application.routes.draw do
  devise_for :users
  root to: 'patients#index'
  resources :patients, only: :index
end
