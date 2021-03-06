class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @album = Album.find_by_id(params[:album_id].to_i)
        @reviews = @album.reviews
  
    end

    def new
        @review = Review.new
        @user_album = UserAlbum.find_by_id(params[:user_album_id])
        #@user_album = UserAlbum.find_by(user_id: current_user.id, album_id: params[:album_id])
       
        #@review.user_album_id = @user_album_id  #do I really need this line? 
        
    end

    def create 
        @review = Review.new(review_params)
        @user_album = @review.user_album      
        if @review.save
            redirect_to review_path(@review)
            # redirect_to user_collection_index_path(current_user.id) #eventually go to Review Show Page
        else
            flash[:error] = "Review creation failed:  #{@review.errors.full_messages.to_sentence}." # add a flash message?
            render :new 
        end

    end

    def show
        @review = Review.find_by_id(params[:id]) # put in a set_review method for show, edit, and update
        @user_album = @review.user_album
    end

    def edit  
        @review = Review.find_by_id(params[:id])
        if @review.user_album.user == current_user
            @user_album = @review.user_album
        else
            flash[:error] = "You are not authorized to edit other user's reviews."
            redirect_to user_collection_index_path(current_user)
        end   
    end

    def update
        @review = Review.find_by_id(params[:id])
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end      
    end

    private
    def review_params
        params.require(:review).permit(:title, :content, :stars, :user_album_id, user_album_attributes: [:favorite, :user_album_id])
    end
end
