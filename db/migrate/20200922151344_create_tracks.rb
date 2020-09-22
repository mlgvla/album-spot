class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.belongs_to :album, foreign_key: true
      t.string :name
      t.integer :duration_ms
      t.integer :track_number

      t.timestamps
    end
  end
end
