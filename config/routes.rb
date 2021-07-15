Rails.application.routes.draw do
  get 'drink_plans/index'
  get 'drink_plans/new'
  get 'drink_plans/create'
  get 'drink_plans/show'
  get 'drink_plans/edit'
  get 'drink_plans/update'
  get 'drink_plans/destroy'
  root "main_plans#index"
  resources :main_plans
end
