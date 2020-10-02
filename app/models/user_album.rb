class UserAlbum < ApplicationRecord
  belongs_to :user
  belongs_to :album
  has_one :review

  validates_uniqueness_of :user_id, :scope => :album_id # Make sure there is only one user/album combo

  
end
