class AddUserAlbumIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :user_album, foreign_key: true
  end
end
