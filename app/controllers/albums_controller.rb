class AlbumsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        All Albums or
        All User Albums (can get from Reviews table)
    end

    def search
        
    end

    def spotcreate
        spotify_album = RSpotify::Album.find(params[:format])
        @album = Album.create_album_from_spotify(spotify_album)
        
        current_user.reviews.build(user_id: current_user.id, album_id: @album.id)
        # Reviews is my join table - I added uniqueness validation in model.  Check here before saving to DB
        
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
