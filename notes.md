Models

User
    has_many :user_albums
    has_many :albums, through: :user_albums
    has_many :reviews, through: :user_albums

    has_secure_password

    validates :username, :email, presence: true
    
    Email - string
    Username - string
    Password_digest - string

    
    

UserAlbum
    belongs_to :user
    belongs_to :album
    Review_ID - integer (has_one?)
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


RSpotify.authenticate("db61cf909fd240d2bc061059a0ac77aa", "52ec96b9564d4a63ab4189145e4eb453")
    - find a better spot for this than application rb.  Make initializer file?  Maybe condsider Spotify OAuth option?

For resetting the primary key when deleting data from a database
    - ActiveRecord::Base.connection.reset_pk_sequence!('table_name') 