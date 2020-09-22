class Album < ApplicationRecord
    belongs_to :artist
    # has_many :user_albums
    # has_many :users, through: :user_albums
    # has_many :tracks
    # has_many :reviews, through: :user_albums
end
