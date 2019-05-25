Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :user_stocks, except: %i[show edit update]
  resources :users, only: %i[show]
  resources :friendships

  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
