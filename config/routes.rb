Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup', to:'users#new'
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  delete 'logout' , to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :users
  #resources :sessions, only: 
  resources :microposts
  resources :relationships, only:[:create, :destroy]
  resources :following_users
  resources :show_follow
end
