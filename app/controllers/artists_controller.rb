class ArtistsController < ApplicationController

    def index
        # Indexing through the search request against Spotify database
        if !params[:artist_name].empty?
            @artists = RSpotify::Artist.search(params[:artist_name])
        else
            redirect_to root_path
        end        
    end

    def search
        
    end

    def show
        
    end

   
end
