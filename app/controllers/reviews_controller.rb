class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @review = Review.new
        @user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id]) 
        @review.user_albums_id = @user_albums_id 
        
       binding.pry
        # @review.build_user_album
    end

    def create
        binding.pry
        @review = Review.new(review_params)
        if @review.save
            #redirect_to album show page
        else
            render :new 
        end

    end

    private
    def review_params
        params.require(:review).permit(:title, :content, :stars, :user_albums_id)
    end
end
