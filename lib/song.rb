class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def Song.create 
    song=self.new 
    self.all << song
    song 
  end 
  
  def Song.new_by_name(name)
    song=Song.new 
    song.name=name 
    song 
  end 
  
  def Song.create_by_name(name)
      song=Song.new 
      song.name=name 
      self.all << song 
      song 
  end
  
  def Song.find_by_name(name)
    b=@@all.find{|i| i.name==name}
    b 
  end 
  
  def Song.find_or_create_by_name(name)
    c=self.find_by_name(name)
    value=nil
    if c 
      value = c
    else 
      d=self.create_by_name(name)
      value=d 
    end 
    value 
  end
  
  def Song.alphabetical
    @@all.sort {|a,b| a.name <=> b.name}
    
  end 
  
  def Song.new_from_filename(name)
    array=[]
    array =name.chomp(".mp3").split(" - ")
    song=Song.new 
    song.artist_name=array[0]
    song.name=array[1]
    song 
  end
  
  def Song.create_from_filename(name)
    e=self.new_from_filename(name)  
    @@all << e 
  end
  
  def Song.destroy_all 
   @@all.clear
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end

