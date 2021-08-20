Rails.application.routes.draw do
  root "fee_infos#new"
  devise_for :shops
  resources :shops, only: [:index, :show]
  resources :fee_infos
  resources :main_plans
  resources :drink_plans
end
