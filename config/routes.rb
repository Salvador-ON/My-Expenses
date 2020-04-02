Rails.application.routes.draw do
  resources :groups
  get 'pages/home'
  get 'pages/profile'
  get '/profile', to: 'pages#profile'
  get '/newgroup', to: 'groups#new'
  root 'pages#home'
  
  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :user do
    get 'signin', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
end
