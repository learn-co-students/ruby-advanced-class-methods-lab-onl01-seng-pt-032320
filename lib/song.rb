class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end
  
  def self.new_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    new_song
  end
  
  def self.create_by_name(song_name)
    new_song = self.new 
    new_song.name = song_name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    @@all.detect do |song|
      song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename(filename)
    new_song = self.new 
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = self.new 
    new_song.name = filename.split(" - ")[1].split(".")[0]
    new_song.artist_name = filename.split(" - ")[0]
    @@all << new_song
  end
  
  def self.destroy_all
    self.all.clear
  end
end
