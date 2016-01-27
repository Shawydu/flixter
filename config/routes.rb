Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :teacher do
    resources :courses, only: [:new, :create, :show]
  end
end
