class UserAlbum < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_one :review

  validates_uniqueness_of :user_id, :scope => :album_id # Make sure there is only one user/album combo

  # does this do the same thing?

  #validates :user_id, uniqueness: { scope: :album_id, message: "That album is already in your collection" }
  
end
