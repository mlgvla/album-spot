class Album < ApplicationRecord
    belongs_to :artist
    # belongs_to :user - this doesn't make sense for my project
    has_many :reviews
    has_many :users, through: :reviews
    has_many :tracks
    
    def self.create_album_from_spotify(spotify_album)

        artist = Artist.find_or_create_by(name: spotify_album.artists[0].name) #eventually make this artist spotify_id

        album =  Album.find_or_create_by(spotify_id: spotify_album.id, artist_id: artist.id) do |a|
                    a.name = spotify_album.name
                    a.release_date = spotify_album.release_date
                    a.number_of_tracks = spotify_album.tracks.count
                    a.image = spotify_album.images[0]["url"]
                    a.copyright = spotify_album.copyrights[0]["text"]
                    a.external_url = spotify_album.external_urls["spotify"]
                    a.label = spotify_album.label
        end
    end
end