class AlbumsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && params[:user_id].to_i == current_user.id
            @user_albums = UserAlbum.where("user_id = ?", params[:user_id]).order(created_at: :desc)
        
            
        else
            flash[:error] = "You can only view your own album collection."
            redirect_to
            # MUST INDICATE ERROR AND THEN REDIRECT TO REVIEWED ALBUM PAGE
            @user_albums = UserAlbum.all.order(created_at: :desc) #distinct.pluck(:album_id) # unique by album ID
            #send a general collection flag in an instance variable OR BETTER #just List from Albums!!!
            
        end
        # All User Albums - make sure you can only view your own album collection
        # All Albums - that have been reviewed by anybody     
    end

    def search
        
    end

    def spotcreate
  
        spotify_album = RSpotify::Album.find(params[:format])
        @album = Album.create_album_from_spotify(spotify_album)
        
        new_user_album = current_user.user_albums.build(user_id: current_user.id, album_id: @album.id)
        new_user_album.save #redirect to My Collection Page (index) show page after checking for save and valid user_album object
        redirect_to user_collection_index_path(current_user.id)
        
        # UserAlbum is my join table - I added uniqueness validation in model.  Check here before saving to DB
        
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
