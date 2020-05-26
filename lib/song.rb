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
  song = self.new #instantiating or creating a new song object
 song.save #saving the new object along with the data/info from the save method above (def save)
 song #returning the new object created from self.new on line 16
end
#binding.pry
def self.new_by_name(name)
  song = self.new
  song.name = name
  song

end

def self.create_by_name(name)
song = Song.create # here we are assigning a variable name song to an instance of a class that was created by the .create method
#the ".create"  method creates an instance of a class so calling a class with it means you are creating/pulling an instance of that class
  song.name = name #Here .name method calls or invokes its action by giving the receiver a name
  # the = name here allows to set the name to be the same as the argument of the entire def method
  song
end

def self.find_by_name(name)
  self.all.find {|song| song.name == name}


end

def self.find_or_create_by_name(name)
#self.create
 #self.find_by_name(name)

 song = find_by_name(name)

if find_by_name(name)
  song
else
self.create_by_name(name)
end
#binding.pry

end

def self.alphabetical
self.all.sort_by {|a| a.name }
#binding.pry
end

def self.new_from_filename(name)
  #binding.pry
folder = name.chomp(".mp3").split(" - ")
#^ Here, we take the file name from the argument and use the chomp method to remove the last 4 characters (.mp3) and use .split to remove the "-"
song = Song.new #<- Here we create a new instance and set in a variable called song
song.name = folder[1] #We use the song instance and assign it with the name from attr_accessor above and pull the foler variable that has the file name
song.artist_name = folder[0]
song #<- Here we call the final output of song
 #binding.pry

end

def self.create_from_filename(name)
  #binding.pry
folder = name.chomp(".mp3").split(" - ")
#^ Here, we take the file name from the argument and use the chomp method to remove the last 4 characters (.mp3) and use .split to remove the "-"
song = Song.new #<- Here we create a new instance and set in a variable called song
song.name = folder[1] #We use the song instance and assign it with the name from attr_accessor above and pull the foler variable that has the file name
song.artist_name = folder[0]
song
song.save
#<- Here we call the final output of song
 #binding.pry

end

def self.destroy_all
self.all.clear
end

end
