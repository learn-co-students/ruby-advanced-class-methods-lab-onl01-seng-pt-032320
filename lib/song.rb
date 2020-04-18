class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all.uniq
  end

  def save
    self.class.all << self
  end

  def self.create
   song = self.new 
   song.save
   song
  end
  
  def self.new_by_name(string_name)
    song = self.new 
    song.name = string_name
    song.save
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end
  
  
  def self.find_by_name(string_name)
    self.all.detect {|instance| instance.name == string_name}
  end
  
  def self.find_or_create_by_name(string_name)
    if self.find_by_name(string_name) 
      return self.find_by_name(string_name) 
    else 
     self.create_by_name(string_name) 
    end
  end
  
  def self.alphabetical
    @@all.sort_by! { |letter| letter.name}
  end
  
  def self.new_from_filename
    
  end
  
  def self.create_from_file_name
    
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
