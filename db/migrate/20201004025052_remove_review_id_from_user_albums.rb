class RemoveReviewIdFromUserAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_albums, :review_id
  end
end
