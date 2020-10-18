class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @review = Review.new
        @user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id])
       
        @review.user_album_id = @user_album_id  #do I really need this line? 
        
    end

    def create 
        @review = Review.new(review_params)       
        if @review.save
            redirect_to review_path(@review)
            # redirect_to user_collection_index_path(current_user.id) #eventually go to Review Show Page
        else
            # add a flash message?
            render :new 
        end

    end

    def show
      @review = Review.find_by_id(params[:id])
    end

    private
    def review_params
        params.require(:review).permit(:title, :content, :stars, :user_album_id, user_album_attributes: [:favorite, :user_album_id])
    end
end
