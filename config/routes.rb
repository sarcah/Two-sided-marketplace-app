Rails.application.routes.draw do
  root 'home#page'
  get 'item/page'
  get 'about/page'

  resources :users
  resources :articles
  resources :transactions, only: [:create]
  get 'checkout/success', to: 'transactions#success'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
