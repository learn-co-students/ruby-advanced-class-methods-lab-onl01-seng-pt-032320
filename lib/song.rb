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
    s = self.new 
    s.save
    s
  end
  
  def self.new_by_name(name)
    s = self.new
    s.name = name
    s
  end
  
  def self.create_by_name(name)
    s = self.create
    s.name = name
    s
  end
  
  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(name)
    s = self.new
    s.name = (name.split(" - ")[1].chomp(".mp3"))
    s.artist_name = (name.split(" - ")[0])
    s
  end
  
  def self.create_from_filename(name)
      s = self.new
    s.name = (name.split(" - ")[1].chomp(".mp3"))
    s.artist_name = (name.split(" - ")[0])
    self.all << s
    s 
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
