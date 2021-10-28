Rails.application.routes.draw do
  namespace :users do
    resources :topics, only: [:index, :show]
  end
  namespace :shops do
    resources :topics
  end
  devise_for :users, controllers: {
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  devise_for :shops, controllers: {
    sessions: "shops/sessions",
    passwords: "shops/passwords",
    registrations: "shops/registrations"
  }
  root "fee_guides#new"
  resources :shops, only: [:index, :show]
  resources :fee_guides
  resources :main_plans
  resources :drink_plans
  resources :users, only: :show

  get "static_pages/coupon"
  get "static_pages/alcohol_plan"
  get "static_pages/fee_table"
end
