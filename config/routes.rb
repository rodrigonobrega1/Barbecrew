Rails.application.routes.draw do
  devise_for :users do
    resources :barbecues only: [ :new, :create ]
  end
  root to: 'pages#home'
  resources :barbecues
end
