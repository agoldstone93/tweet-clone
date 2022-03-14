Rails.application.routes.draw do
  root 'timeline#index'
  get 'timeline', to: "timeline#index"
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
