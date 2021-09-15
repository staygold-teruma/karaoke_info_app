Rails.application.routes.draw do
  devise_for :users
  root "fee_guides#new"
  devise_for :shops
  resources :shops, only: [:index, :show]
  resources :fee_guides
  resources :main_plans
  resources :drink_plans
  resources :topics
end
