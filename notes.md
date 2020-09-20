Models

User
    has_many :user_albums
    has_many :albums, through: :user_albums
    has_many :reviews, through: :user_albums
    Email - string
    Username - string
    Password_digest - string
    

UserAlbum
    belongs_to :user
    belongs_to :album
    has_one: :review
    Rating - integer



Album
    belongs_to :artist
    has_many :user_albums
    has_many :users, through: :user_albums
    has_many :tracks
    has_many :reviews, through: :user_albums
    Name - string
    Release Date - string
    Number of Tracks - integer
    Image - string (link to Spotify image)
    Copyright - string
    External URL - string (link to Spotify content)
    Label - string



Track
    belongs_to :album
    Name - string
    Duration_ms - integer
    Track Number - integer


Artist
    has_many :albums
    Name - string
    Genre - string
    Image - string (link to Spotify image)


Review
    belongs_to :user_album
    Title - string
    Content - text


