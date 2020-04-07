Rails.application.routes.draw do

  resources :groups

  resources :transactions

  get 'pages/home'
  get 'pages/profile'
  get '/profile', to: 'pages#profile'
  get '/newgroup', to: 'groups#new'
  get '/newtransaction', to: 'transactions#new'
  get '/etransactions', to: 'transactions#etransaction'
  get '/memberstransactions', to: 'transactions#members_transactions'



  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
    get 'edit_profile', to: 'devise/registrations#edit'
    get 'signup', to: 'devise/registrations#new'

    authenticated :user do
      root 'pages#profile'
    end
  
    unauthenticated do
      root 'pages#home'
    end
  end
end
