class User < ApplicationRecord
    has_many :reviews
    has_many :albums, through: :reviews
    has_many :reviewed_albums, through: :reviews, source: :albums #only albums the user has reviewed

    # has_many :albums # all a user's albums, reviewed or not.  Do I have to define a reader?
  

    has_secure_password

    validates :username, :email, presence: true

    def self.create_by_github(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
          u.username = auth[:info][:name]
          u.uid = auth[:uid]
          u.provider = auth[:provider]
          u.password = SecureRandom.hex 
        end
    end
end
