# frozen_string_literal: true

Rails.application.routes.draw do
  get 'profile/index'
  get 'timeline/index'
  get 'timeline', to: 'timeline#index'
  get 'profile', to: 'profile#index'
  root 'timeline#index'

  resources :tweets
  
  devise_for :accounts 
  
  resources :account do
    member do
      get :following, :followers
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
