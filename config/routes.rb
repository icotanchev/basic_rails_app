Rails.application.routes.draw do
  devise_for :users
  resources :users

  root to: "daily_reports#index"

  resources :daily_reports do
    collection do
      post :export_daily_report
      post :add_daily_report_fields
      post :add_daily_cost_fields
    end
  end

  resources :clients
end
