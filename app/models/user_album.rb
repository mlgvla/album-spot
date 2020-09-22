class UserAlbum < ApplicationRecord
  belongs_to :user
  belongs_to :album
  # has_one :review
end
