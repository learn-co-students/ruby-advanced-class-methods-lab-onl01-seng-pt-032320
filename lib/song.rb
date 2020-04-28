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
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  def self.new_from_filename(song_name)
    artist = song_name.split(' - ')[0].strip
    name_song = song_name.split(' - ')[1].strip.split('.')[0].strip
    song = self.new
    song.name = name_song
    song.artist_name = artist
    song
  end
  def self.create_from_filename(song_name)
    artist = song_name.split(' - ')[0].strip
    name_song = song_name.split(' - ')[1].strip.split('.')[0].strip
    song = self.create
    song.name = name_song
    song.artist_name = artist
    song
  end
  def self.destroy_all
    @@all.clear
  end
end
# Song.create_by_name("Hello")
# Song.find_by_name("Hello")
# binding.pry
