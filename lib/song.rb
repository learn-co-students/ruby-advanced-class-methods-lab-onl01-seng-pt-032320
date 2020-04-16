require 'pry'

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
    song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = new_by_name(song_name)
    song.save
    song
  end
  
  def self.find_by_name(search_name)
    @@all.find { |song| song.name == search_name}
  end
  
  def self.find_or_create_by_name(search_name)
    find_by_name(search_name) || create_by_name(search_name)
  end
  
  def self.alphabetical
    @@all.sort_by{ |song_data| song_data.name}
      end
  
  def self.new_from_filename(filename)
    info = filename.match(/(?<artist>[\w\W]+)(?:\s\W\s)(?<song>[\w\W]+)(?:\.[\S]{3})/i)
    song = self.new
    song.name = info[:song]
    song.artist_name = info[:artist]
    song
  end
  
  def self.create_from_filename(filename)
    info = filename.match(/(?<artist>[\w\W]+)(?:\s\W\s)(?<song>[\w\W]+)(?:\.[\S]{3})/i)
    song = self.new
    song.name = info[:song]
    song.artist_name = info[:artist]
    song.save
    song
  end
 # binding.pry
  
  def self.destroy_all
    @@all=[]
  end
  
end

