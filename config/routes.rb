Rails.application.routes.draw do

#   resources :tracks
#   resources :reviews
#   resources :user_albums
#   resources :users
#   resources :albums

    root 'sessions#welcome'

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    get '/artists', to: 'artists#index'
    get '/artists/search', to: 'artists#search', as: 'search_artist'
    get '/artists/:id', to: 'artists#show', as: 'artist'



    get '/albums', to: 'albums#index'
    get '/albums/search', to: 'albums#search', as: 'search_album'
    get '/albums/:id', to: 'albums#show', as: 'album'


    # get 'sessions/welcome'
    # get 'sessions/new'
    # get 'sessions/create'
    # get 'sessions/destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
