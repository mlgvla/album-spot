class Review < ApplicationRecord
    belongs_to :user_album
  
    validates :user_album, uniqueness: true #add a message?
    validates :stars, presence: true, inclusion: { in: 0..5, message: "must have rating from 0 to 5" }
    validates :content, length: { minimum: 10}, allow_blank: true    

    def user_album_attributes=(user_album_attributes)
        self.user_album_id = user_album_attributes["user_album_id"]
        self.user_album.update(favorite: user_album_attributes["favorite"])
    end

    
# message: "Please rate the album out of 5"

  
end
