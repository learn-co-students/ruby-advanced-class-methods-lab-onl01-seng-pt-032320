

class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.create
    song = Song.new 
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
   def self.new_by_name (name)
    newsong = Song.new
    newsong.name = name
    newsong
    end
    
  def self.create_by_name(name)
    namesong = Song.new_by_name(name)
    namesong.save
    namesong
  end
    
  def self.find_by_name (name)
     self.all.find do |song|
      if song.name == name
        return song
      end
    end
  end
  
  def self.find_or_create_by_name (name)
     if self.find_by_name (name)
      return self.find_by_name (name)
      else 
        self.create_by_name (name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end
  
  def self.new_from_filename (filename)
    newsong = self.create
    artist_name = (filename.split (" - "))[0]
    newsong.artist_name = artist_name
    name = (filename.split (" - "))[1].split(".mp3")
    newsong.name = name.join
    return newsong
  end
  
  def self.create_from_filename (filename)
    newsong = self.new_from_filename (filename)
    newsong.save
  end
    
  def self.destroy_all
    @@all = []
  end
    
end
