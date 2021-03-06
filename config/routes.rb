Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: 'accounts#index'

  namespace :transfer do
    resources :transactions
    resources :outcomes
    resources :incomes
  end
  resources :accounts
  resources :master_categories
  resources :categories

end
