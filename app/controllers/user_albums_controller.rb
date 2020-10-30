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
            binding.pry
            flash[:error] = "You can only view your own album collection."
            #maybe return to user_collection_index
            redirect_to reviewed_albums_path #this page will hold all albums that have reviews, no duplicates
            # MUST INDICATE ERROR AND THEN REDIRECT TO REVIEWED ALBUM PAGE
            @user_albums = UserAlbum.all.order(created_at: :desc) #distinct.pluck(:album_id) # unique by album ID
            #send a general collection flag in an instance variable OR BETTER #just List from Albums!!!
            
        end
        # All User Albums - make sure you can only view your own album collection
        # All Albums - that have been reviewed by anybody     
    end

    def reviewed_albums_index
        binding.pry #catch artist selection in a search action - TBD. Create Artist method to collect albums
        @user_albums = UserAlbum.joins(:review).uniq {|ua| ua.album_id} # we only want each reviewed_album to appear once in the index
        render '/user_albums/reviewed_index'
    end

    def destroy
        # need album ID before destroying

        UserAlbum.find(params[:id]).destroy

        #after destroying user_album, are any left with that album_id?  If not, delete the album db
        # if UserAlbum.any? {|ua| ua.album_id == params[:id]}...
            

        redirect_to user_collection_index_path(current_user.id)
    end

end
