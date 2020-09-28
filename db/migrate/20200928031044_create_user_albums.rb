class CreateUserAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :user_albums do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :album, foreign_key: true
      t.integer :review_id
      t.boolean :favorite

      t.timestamps
    end
  end
end
