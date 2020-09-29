Rails.application.routes.draw do

  # resources :user_albums
#   resources :tracks
#   resources :reviews


    root 'sessions#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    delete '/logout', to: 'sessions#destroy'

    get '/auth/:provider/callback', to: 'sessions#omniauth'

    # resources :users
    
 
    get '/artists', to: 'artists#index'
    get '/artists/search', to: 'artists#search', as: 'search_artist'
    get '/artists/:id', to: 'artists#show', as: 'artist'


    resources :albums
    get '/albums/search', to: 'albums#search', as: 'search_album'
    get '/albums/spotcreate', to: 'albums#spotcreate', as: 'spot_create_album'
   

    resources :users do
        resources :albums, only: [:index], as: "collection"
    end
  


    # get 'sessions/welcome'
    # get 'sessions/new'
    # get 'sessions/create'
    # get 'sessions/destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
