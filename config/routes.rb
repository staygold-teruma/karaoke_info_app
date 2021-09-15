Rails.application.routes.draw do
  root "fee_guides#new"
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
  resources :shops, only: [:index, :show]
  resources :fee_guides
  resources :main_plans
  resources :drink_plans
  resources :topics
end
