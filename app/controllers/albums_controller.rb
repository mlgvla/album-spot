class AlbumsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        # All User Albums - make sure you can only view your own album collection
        # All Albums - that have been reviewed by anybody     
    end

    def search
        
    end

    def spotcreate
        spotify_album = RSpotify::Album.find(params[:format])
        @album = Album.create_album_from_spotify(spotify_album)
        
        new_user_album = current_user.user_albums.build(user_id: current_user.id, album_id: @album.id)
        new_user_album.save #redirect to album show page after checking for save and valid user_album object
        
        binding.pry
        # UserAlbum is my join table - I added uniqueness validation in model.  Check here before saving to DB
        
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
