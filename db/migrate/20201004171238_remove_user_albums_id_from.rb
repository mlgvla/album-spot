class RemoveUserAlbumsIdFrom < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :user_albums_id
  end
end
