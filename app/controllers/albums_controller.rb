class AlbumsController < ApplicationController

    def index
        
    end

    def search
        
    end

    def spotcreate
        spotify_album = RSpotify::Album.find(params[:format])
        @album = Album.create_album_from_spotify(spotify_album)
        #find a way to save user and album to the Review join table
        #consider a way to use an alias name for the Review table like ""  
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
