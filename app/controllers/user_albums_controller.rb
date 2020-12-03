class UserAlbumsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
     
        if params[:user_id] && params[:user_id].to_i == current_user.id
            #@user_albums = UserAlbum.where("user_id = ?", params[:user_id]).order(created_at: :desc) # try scoping this!
            #@user_albums = UserAlbum.user(params[:user_id]) #default
            #dry up this code!  user_album_collection = UserAlbum.user(params[:user_id])
            if params[:filter] == "Highest Rated"
               @user_albums = UserAlbum.user(params[:user_id]).highest_rated
            elsif params[:filter] == "Lowest Rated"
               @user_albums = UserAlbum.user(params[:user_id]).lowest_rated
            elsif params[:filter] == "Newest Additions"
               @user_albums = UserAlbum.user(params[:user_id]).newest
            elsif params[:filter] == "Oldest Additions"
               @user_albums = UserAlbum.user(params[:user_id]).oldest
            else
                @user_albums = UserAlbum.user(params[:user_id]).newest #default
            end       
            
        else
           # FIX THIS!!!!
            flash[:error] = "You can only view your own album collection."
            #maybe return to user_collection_index
            redirect_to user_collection_index_path(current_user.id) #this page will hold all albums that have reviews, no duplicates
            # MUST INDICATE ERROR AND THEN REDIRECT TO REVIEWED ALBUM PAGE
            #@user_albums = UserAlbum.all.order(created_at: :desc) #distinct.pluck(:album_id) # unique by album ID
            #send a general collection flag in an instance variable OR BETTER #just List from Albums!!!
            
        end
        # All User Albums - make sure you can only view your own album collection
        # All Albums - that have been reviewed by anybody     
    end

    def reviewed_albums_index #dry up the code!
        if params[:artist_id]
         
            reviewed_user_albums = UserAlbum.joins(:review).uniq {|ua| ua.album_id}
            @user_albums = reviewed_user_albums.select {|ua| ua.album.artist_id == params[:artist_id].to_i}
        else
            
         @user_albums = UserAlbum.joins(:review).uniq {|ua| ua.album_id} # we only want each reviewed_album to appear once in the index
      
        end
        @current_artists_array = Artist.current_artists.map {|artist| [artist.name, artist.id]} #artists of currently-reviewed albums - for select box
      
        render '/user_albums/reviewed_index'
    end

    def destroy
        # I probably don't need to do authorization since it can't be hacked through the address bar

        user_album = UserAlbum.find(params[:id])
        if user_album.user == current_user
            user_album.destroy
        else
            flash[:error] = "You are not authorized to perform this action."
        end
        redirect_to user_collection_index_path(current_user.id)

        #Optimization:
        #after destroying user_album, are any user_albums left with that album_id?  If not, delete the album db
        # if UserAlbum.any? {|ua| ua.album_id == params[:id]}...              
    end
end
