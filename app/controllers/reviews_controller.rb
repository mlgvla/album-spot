class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        
        @user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id]) 
        @review = Review.new #I think I have to build the review onto the user_album.      
    end

    def create
        binding.pry
    end
end
