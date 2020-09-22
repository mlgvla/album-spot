class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.belongs_to :artist, foreign_key: true
      t.string :name
      t.string :release_date
      t.integer :number_of_tracks
      t.string :image
      t.string :copyright
      t.string :external_url
      t.string :label

      t.timestamps
    end
  end
end
