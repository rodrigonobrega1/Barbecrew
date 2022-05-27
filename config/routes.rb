Rails.application.routes.draw do
  root to: 'barbecues#index'
  resources :barbecues do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  devise_for :users do
  end

  resources :bookings, only: [:index, :show, :destroy]
  resources :users, as: :user_barbecues
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
