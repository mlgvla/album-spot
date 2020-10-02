class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @review = Review.new
        @user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id])       
    end

    def create
        binding.pry
    end
end
