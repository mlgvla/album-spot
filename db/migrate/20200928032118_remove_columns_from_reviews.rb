class RemoveColumnsFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, foreign_key: true
    remove_reference :reviews, :album, foreign_key: true
  end
end
