class Review < ApplicationRecord
    belongs_to :user_album  

    validates :user_album, uniqueness: true #add a message?

    def user_album_attributes=(user_album_attributes)
        self.user_album_id = user_album_attributes["user_album_id"]
        self.user_album.update(favorite: user_album_attributes["favorite"])
    end



  
end
