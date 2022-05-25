Rails.application.routes.draw do
  root to: 'barbecues#index'
  resources :barbecues
  devise_for :users do
  end

  resources :bookings
  resources :users
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
