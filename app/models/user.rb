class User < ApplicationRecord
    has_many :reviews
    has_many :albums, through: :reviews
    has_many :reviewed_albums, through: :reviews, source: :albums

    # has_many :albums (that they have created - probably shouldn't do this)
  

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
