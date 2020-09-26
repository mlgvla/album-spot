class AlbumsController < ApplicationController

    def index
        All Albums or
        All User Albums (can get from Reviews table)
    end

    def search
        
    end

    def spotcreate
        spotify_album = RSpotify::Album.find(params[:format])
        @album = Album.create_album_from_spotify(spotify_album)

        # Reviews is my join table - make sure write validation that the record is unique by the foreign keys
        current_user.reviews.build(user_id: current_user.id, album_id: @album.id)
        
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
