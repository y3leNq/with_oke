Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'homes#top'
  get 'signup', to: 'users#new', as: :signup
  post 'signup', to: 'users#create'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  get 'search', to: 'songs#search', as: :search

  resources :password_resets, only: %i[new create edit update]
  resources :songs, only: %i[index new create show]
  resources :playlists do
    resources :songs, only: %i[edit update destroy]
  end
end
