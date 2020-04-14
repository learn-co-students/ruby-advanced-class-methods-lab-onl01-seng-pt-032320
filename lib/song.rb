require "pry"

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
    song = self.new
    self.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|person| person.name == name}
  end
  
  def self.find_or_create_by_name(name)
    finder = find_by_name(name)
    if finder != nil
      finder
     else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by &:name
  end
  
  def self.new_from_filename(file)
    raw_data = file.split("-")
    artist = raw_data[0].strip
    raw_data = raw_data[1]
    raw_data = raw_data.split(".")
    name = raw_data[0].strip
    song = self.new 
    song.name = name
    song.artist_name = artist
    song
  end
  
  def self.create_from_filename(file)
    raw_data = file.split("-")
    artist = raw_data[0].strip
    raw_data = raw_data[1]
    raw_data = raw_data.split(".")
    name = raw_data[0].strip
    song = self.new 
    song.name = name
    song.artist_name = artist
    self.all << song
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
