class User < ApplicationRecord
    has_many :user_albums
    has_many :albums, through: :user_albums
    has_many :reviews, through: :user_albums

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
