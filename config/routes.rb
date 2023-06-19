Rails.application.routes.draw do
  root 'homes#top'
  get 'signup', to: 'users#new', as: :signup
  post 'signup', to: 'users#create'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
end
