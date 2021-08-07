Rails.application.routes.draw do
  root "fee_infos#new"
  resources :fee_infos
  resources :main_plans
  resources :drink_plans
end
