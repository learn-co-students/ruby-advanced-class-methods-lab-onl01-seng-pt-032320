class Song
  attr_accessor :name, :artist_name
  @@all = []
 
  def self.all
    @@all
  end
 
  def save
    self.class.all << self
  end
 
  def self.create
    song = self.new ## => it is saying song = Song.new
    song.save       ## call the save on song instance
    song            ## => returns song
  end
 
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
 
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
 
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
 
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name)
  end
 
  def self.alphabetical
    @@all.sort_by{|s| s.name}
  end
 
  def self.new_from_filename(filename)
    artist_song = filename.delete_suffix('.mp3')
    array = artist_song.split(' - ')
    name = array[1]
    artist_name = array[0]
    binding.pry
    song = self.new
    song.artist_name = artist_name
    song.name = name
  end
  
end