class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @review = Review.new
        @user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id]) 
        @review.user_album_id = @user_album_id         
    end

    def create 
        @review = Review.new(review_params)       
        binding.pry
        if @review.save
            binding.pry
            redirect_to collection_path(current_user.id)
        else
            render :new 
        end

    end

    private
    def review_params
        params.require(:review).permit(:title, :content, :stars, :user_album_id, user_album_attributes: [:favorite, :user_album_id])
    end
end
