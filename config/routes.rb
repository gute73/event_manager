Rails.application.routes.draw do

	root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'

  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  post '/rsvp', to: 'attendings#create'

  delete '/unrsvp', to: 'attendings#destroy'

  resources :users, only: [:new, :create, :show]

  resources :events, only: [:show, :new, :create, :destroy]

end
