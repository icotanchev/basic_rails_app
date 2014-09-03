Rails.application.routes.draw do
  root to: "daily_reports#index"

  resources :daily_reports
  resources :clients
end
