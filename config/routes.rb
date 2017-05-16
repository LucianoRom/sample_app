Rails.application.routes.draw do
  resources :games
  resources :updates
  get 'password_resets/new'

  get 'password_resets/edit'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  root 'apis#index'
  get '/help', to: 'static_pages#help'
  get '/contact', to: 'static_pages#contact'
  get '/about', to: 'static_pages#about'
  get '/login', to: 'session#new'
  get '/home', to: 'static_pages#home'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end


  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :apis, only: [:create, :show, :destroy, :new, :index, :edit, :update]
end
