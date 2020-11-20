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
    song = Song.new #creates var song and sets equal to new instance of Song class
    song.save #saves that new variable with .save method, which pushes that song into self.all array
    song #returns the new song
  end
  binding.pry
  
  def self.new_by_name(song_name)
    song = self.new #set song variable equal to new instance of class
    song.name = song_name #arguemnt is equal to name of the instance of Song class
    song # returns song
  end
  
  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end
  binding.pry

  def self.find_by_name(song_name)
    self.all.find { |song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

 def self.new_from_filename(artist_data)
    data = artist_data.split(' - ')
    artist_name = data[0]
    song_name = data[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  def self.create_from_filename(artist_data)
    data = artist_data.split(' - ')
    artist_name = data[0]
    song_name = data[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    binding.pry
    song
  end 
  def self.destroy_all
    self.all.clear
  end 
  
end 


