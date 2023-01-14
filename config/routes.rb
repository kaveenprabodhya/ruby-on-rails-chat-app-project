Rails.application.routes.draw do
  root 'chatroom#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  delete 'logout', to: 'sessions#destroy'
  
  get 'register', to: 'users#new'
  
  post 'message', to: 'messages#create'

  resources :users, except: [:new]

  mount ActionCable.server, at: '/cable'
end
