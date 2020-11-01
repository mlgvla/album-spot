class Artist < ApplicationRecord
    has_many :albums 

    def self.current_artists #artists currently having albums in the user_album reviews
        @user_albums = UserAlbum.joins(:review).uniq {|ua| ua.album_id}

        artists = @user_albums.collect {|ua| ua.album.artist}
        sorted_artists = artists.sort_by {|artist| artist.name }.uniq
       
    end
end
