Rails.application.routes.draw do
  resources :defaults

  devise_for :users
  resources :users

  root to: "defaults#index"
end
