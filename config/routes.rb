Rails.application.routes.draw do
  devise_for :users
  
  get 'about/page'
  get '/search', to:"articles#search"

  resources :users
  resources :articles
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success'

  root 'home#page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
