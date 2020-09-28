class AddUserAlbumsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :user_albums, foreign_key: true
  end
end
