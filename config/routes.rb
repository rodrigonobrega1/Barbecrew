Rails.application.routes.draw do
  root to: 'barbecues#index'
  devise_for :users do
    resources :barbecues
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
