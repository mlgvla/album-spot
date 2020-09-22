class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.belongs_to :user_album, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
