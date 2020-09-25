class Album < ApplicationRecord
    belongs_to :artist
    # belongs_to :user - this doesn't make sense for my project
    has_many :reviews
    has_many :users, through: :reviews
    has_many :tracks
    
    def create_album_from_spotify(spotify_album)
        # Check to see if album exists using id using find
        # if doesn't, then build it
        #     Album.find_or_create_by(spotify_album.id) do |album|
        #         album.name = spotify_album.name
        #         etc.
        #     end
        # Dont forget to build the Artist, too!  And Tracks!
    end
end
