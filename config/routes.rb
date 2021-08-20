Rails.application.routes.draw do
  get 'informations/index'
  get 'informations/new'
  get 'informations/create'
  get 'informations/show'
  get 'informations/edit'
  get 'informations/update'
  get 'informations/destroy'
  root "fee_infos#new"
  devise_for :shops
  resources :shops, only: [:index, :show]
  resources :fee_infos
  resources :main_plans
  resources :drink_plans
  resources :informations
end
