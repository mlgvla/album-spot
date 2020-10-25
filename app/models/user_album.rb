class UserAlbum < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_one :review, dependent: :destroy #when user_album is deleted, so is the corresponding review for that album.

  validates_uniqueness_of :user_id, :scope => :album_id # Make sure there is only one user/album combo

  # does this do the same thing?

  #validates :user_id, uniqueness: { scope: :album_id, message: "That album is already in your collection" }
  
end
