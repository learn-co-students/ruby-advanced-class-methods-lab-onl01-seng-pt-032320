class Song
  attr_accessor :name, :artist_name
  @@all = []


  # def initialize(song)
  # #   @song = song
  # #   #@artist_name = artist_name
  # # end


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # .create
  #     instantiates and saves the song, and it returns the new song that was created

  def self.create
    song = Song.new
    song.save
    return song
  end
  # .new_by_name
  #   instantiates a song with a name property
  def self.new_by_name(name="Blank Space")
    song = Song.new
    song.name = name
    song
  end

  # # .create_by_name
  #   instantiates and saves a song with a name property

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  # .find_by_name
  #   can find a song present in @@all by name (FAILED - 1)
  #   returns falsey when a song name is not present in @@all

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  # .find_or_create_by_name
  #  invokes .find_by_name and .create_by_name instead of repeating code
  #  returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
  #  creates a new Song object with the provided title if one doesn't already exist

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  # .alphabetical
  # returns all the song instances in alphabetical order by song name

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  # .new_from_filename
  #   initializes a song and artist_name based on the filename format

  def self.new_from_filename(filename)
    filename = filename.split(' - ')
    artist_name = filename[0]
    name = filename[1].split('.mp3')[0]

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  # .create_from_filename
  #     initializes and saves a song and artist_name based on the filename format

  def self.create_from_filename(filename)
   result = self.new_from_filename(filename)
   song = self.create
   song.name = result.name
   song.artist_name = result.artist_name
   song
  end

  # .destroy_all
  #   clears all the song instances from the @@all array

  def self.destroy_all
    self.all.clear
  end
end
