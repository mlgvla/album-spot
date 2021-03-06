Rails.application.routes.draw do

  
#   resources :tracks



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


 
    get '/albums/search', to: 'albums#search', as: 'search_album'
    get '/albums/spotcreate', to: 'albums#spotcreate', as: 'spot_create_album'

    get '/user_albums/reviewed_albums', to: 'user_albums#reviewed_albums_index', as: 'reviewed_albums'

    resources :reviews, only: [:index, :create, :show, :edit, :update] # probably don't need :index
    
    # I should probably nest the new/create review under :user_album, not :album
    resources :albums, only: [:show] do
        resources :reviews, only: [:index]
    end
    
    resources :user_albums, only: [:index, :destroy] do
        resources :reviews, only:[:new, :create]
    end
   
    #resources :user_albums, only: [:edit]

    resources :users do
        resources :user_albums, only: [:index], as: "collection" 
    end
  


    # get 'sessions/welcome'
    # get 'sessions/new'
    # get 'sessions/create'
    # get 'sessions/destroy'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
