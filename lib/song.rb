class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    s = self.new 
    s.save 
    s
  end
  
  def self.new_by_name(name)
    s = self.new 
    s.name = name
    s.save
    s
  end
  
  def self.create_by_name(name)
    s = self.new 
    s.name = name
    s.save
    s
  end
  
  def self.find_by_name(name)
    self.all.detect {|i| i.name == name}
  end
  
  def self.find_or_create_by_name(find_this_song)
    if self.find_by_name(find_this_song) == nil
      self.create_by_name(find_this_song)
    else
      self.find_by_name(find_this_song)
    end
  end 
  
  def self.alphabetical
    self.all.sort_by { |x| x.name}
  end 
  
  def self.new_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c
  end 
  
  def self.create_from_filename(mp3_formatted_file)
    c = self.new 
    c.name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    c.artist_name = mp3_formatted_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    c.save
    c
  end 
  
  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
end
