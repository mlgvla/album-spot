class UserAlbumsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        if params[:user_id] && params[:user_id].to_i == current_user.id
            @user_albums = UserAlbum.where("user_id = ?", params[:user_id]).order(created_at: :desc)
        
            
        else
            flash[:error] = "You can only view your own album collection."
            redirect_to reviews_path #this page will hold all albums that have reviews, no duplicates
            # MUST INDICATE ERROR AND THEN REDIRECT TO REVIEWED ALBUM PAGE
            @user_albums = UserAlbum.all.order(created_at: :desc) #distinct.pluck(:album_id) # unique by album ID
            #send a general collection flag in an instance variable OR BETTER #just List from Albums!!!
            
        end
        # All User Albums - make sure you can only view your own album collection
        # All Albums - that have been reviewed by anybody     
    end

end
