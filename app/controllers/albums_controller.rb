class AlbumsController < ApplicationController

    def index
        
    end

    def search
        
    end

    def spotcreate
        @album = RSpotify::Album.find(params[:format])
        binding.pry    
    end

    
    def show
        @album = RSpotify::Album.find(params[:id]) 

    end
end
