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
    song = self.new
    song.name = name
    # binding.pry
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    # binding.pry
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort do |song_a, song_b|
      song_a.name <=> song_b.name
    end
  end

  def self.new_from_filename(filename)
    song_array = filename.split(".")[0].split(" - ")
    artist = song_array[0]
    name = song_array[1]
    song = self.create_by_name(name)
    song.artist_name = artist
    song
  end


  def self.create_from_filename(filename)
    song_array = filename.split(".")[0].split(" - ")
    artist = song_array[0]
    name = song_array[1]
    song = self.create_by_name(name)
    song.artist_name = artist
  end

  def self.destroy_all
    self.all.clear
  end
end