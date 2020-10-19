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

    
    

UserAlbum - DELETED
    belongs_to :user
    belongs_to :album
    Review_ID - integer (has_one?)
    Rating - integer



Album
    belongs_to :artist
    belongs_to :user???? do I need this?  I don't think so.
    has_many :reviews
    has_many :users, through: :reviews
    has_many :tracks
    Name - string
    Release Date - string
    Number of Tracks - integer
    Image - string (link to Spotify image)
    Copyright - string
    External URL - string (link to Spotify content)
    Label - string
    Spotify_ID - string *add*



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
    belongs_to :user
    belongs_to :album
    Title - string
    Content - text


RSpotify.authenticate("db61cf909fd240d2bc061059a0ac77aa", "52ec96b9564d4a63ab4189145e4eb453")
    - find a better spot for this than application rb.  Make initializer file?  Maybe condsider Spotify OAuth option?

For resetting the primary key when deleting data from a database
    - ActiveRecord::Base.connection.reset_pk_sequence!('table_name') 

Next in user flow:
    - Save Album to collection (reviews) and rate and reviewe
    - Add spotify_id to Artist table and assign other attributes in Spotify create album method
    - Consider deleting track model since I have the widget

    - Page authorizations - double check they are all there - just add the before action

    - Put Container div in application layout file 

    - Make the Add a Review Page

    - Show action in Album Controller should test for spotify_id or database ID so it can display from either id?

    - *** Album Collection page (album index page shows collection) - these should be cards with album art, add or edit review buttons, which are dynamic)
            - check to see if review exists to determine button text
            - button to view album show page and its collected reviews from all users

    - Add Album Spot Collection and My Collection to Navbar - completes index nested route requirement

    - Add scope methods to Album model - Newest addition, oldest addtion, highest rated, lowest rated

    - Add delete user_album with confirmation modal eg.<%= link_to "Delete", user_album_path(user_album), method: :delete, data: { confirm: "Are you sure you want to delete this album from your collection?" } %>

    - build a review off of an existing user_album in review#new

    - Review.joins(:user_album).where("album_id = 2").average(:stars).round

