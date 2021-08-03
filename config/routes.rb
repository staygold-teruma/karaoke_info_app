Rails.application.routes.draw do
  root "main_plans#index"
  resources :fee_infos
  resources :main_plans
  resources :drink_plans
end
