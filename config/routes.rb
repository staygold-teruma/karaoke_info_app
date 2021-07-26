Rails.application.routes.draw do
  get 'fee_info/index'
  get 'fee_info/new'
  get 'fee_info/crreate'
  get 'fee_info/show'
  get 'fee_info/edit'
  get 'fee_info/update'
  get 'fee_info/destroy'
  root "main_plans#index"
  resources :fee_infos
  resources :main_plans
  resources :drink_plans
end
