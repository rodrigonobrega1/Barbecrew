Rails.application.routes.draw do
  root to: 'barbecues#index'
  devise_for :users do
  end
  resources :barbecues
  resources :bookings
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
