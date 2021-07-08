Rails.application.routes.draw do
  get 'main_plans/index'
  get 'main_plans/new'
  get 'main_plans/create'
  get 'main_plans/show'
  get 'main_plans/edit'
  get 'main_plans/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
