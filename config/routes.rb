Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :user_stocks, except: %i[show edit update]
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  resources :user_stocks, only: %i[create destroy]
end
