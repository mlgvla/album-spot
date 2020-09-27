class Review < ApplicationRecord
  belongs_to :user
  belongs_to :album

  validates_uniqueness_of :user_id, :scope => :album_id # Make sure there is only one user/album combo
end
