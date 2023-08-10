Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'homes#top'
  get 'signup', to: 'users#new', as: :signup
  post 'signup', to: 'users#create'
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout
  get 'search', to: 'songs#search', as: :search
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider

  resource :user, only: %i[edit update]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :songs, only: %i[index new create] do
    resources :scores
  end
  resources :email_changes, only: [:new, :create] do
    get 'update', to: 'email_changes#update', on: :member
  end

  resources :playlists do
    resources :songs, only: %i[edit update destroy show]
  end
end
