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
    song = Song.new 
    song.save     
    song 
  end 
  
  def self.new_by_name(name) 
    song = Song.new 
    song.name = name 
    song 
  end 
    
    
  def self.create_by_name(name)
    song = Song.new 
    song.name = name 
    song.save 
    song 
  end 
  
  def self.find_by_name(name) 
    self.all.find {|song| song.name == name}   #returns @name = "hello" 
  end 
    
  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil 
      create_by_name(name)
    else 
      find_by_name(name)
    end 
  end 
  
  def self.alphabetical 
    self.all.sort_by{|song| song.name}
  end 
 
  def self.new_from_filename(filename)
    song = self.new 
    filename_array = filename.split(" - ")
    song_artist = filename_array[0]   
    song_name = filename_array[1].split(".mp3")[0]  
    song.artist_name = song_artist                
    song.name = song_name
    song 
  end 
  
  

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)    
    song.save 
  end 
  
  def self.destroy_all
    self.all.clear
  end 

end
