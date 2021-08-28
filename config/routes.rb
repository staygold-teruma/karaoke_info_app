Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/new'
  get 'topics/create'
  get 'topics/show'
  get 'topics/edit'
  get 'topics/update'
  get 'topics/destroy'
  root "fee_guides#new"
  devise_for :shops
  resources :shops, only: [:index, :show]
  resources :fee_guides
  resources :main_plans
  resources :drink_plans
end
