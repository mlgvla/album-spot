class Review < ApplicationRecord
  belongs_to :user_album  

  accepts_nested_attributes_for :user_album

  
end
