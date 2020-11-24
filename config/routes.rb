Rails.application.routes.draw do
  get "/dashboard" => 'appointments#index', as: :dashboard
  resources :appointments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
