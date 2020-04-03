require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  
  def self.create
    song = Song.new #initializes song
    @@all.push(song) #adds the song to @@all
    song #returns that instance of song
  end
  
  def self.new_by_name(name)
    song = Song.new 
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all.push(song)
    song
  end
  
  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
    
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end  
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.alphabetical #iterate through @@all and sort
    self.all.sort_by do |song|
      song.name
    end
    
  end
  
  def self.new_from_filename(filename)
    song_arr = []
    
    song_arr = filename.split(" - ")#moved the song into a array and split it at the -
    
     artist_name = song_arr[0] #assigned first index to artist_name
     name = song_arr[1].gsub(".mp3", "") #assigned second #gsub---> global substituion index to song_name
     song = self.new
     song.name = name
     song.artist_name = artist_name
     song.save
     return song
  end
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end
  
  def self.destroy_all
    @@all.clear()
  end

end


