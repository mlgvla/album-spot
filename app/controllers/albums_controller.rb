class AlbumsController < ApplicationController

    def index
        
    end

    def search
        
    end

    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
