require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name="", artist="")
    @artist_name = artist
    @name = name
  end
  def self.all
    @@all
  end
  def save
    self.class.all << self
  end
  def self.create
    created = self.new
    @@all << created
    created
  end
  def self.new_by_name(name)
    if !@@all.include?(name)
    self.new(name)
  end
  end
  def self.create_by_name(name)
    new_song = self.new(name)
    @@all << new_song
    new_song
  end
  def self.find_by_name(name)
    self.all.find {|s| s.name == name}
  end
  def self.find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == NIL
      found = self.create_by_name(name)
    end
    found
  end 
  def self.alphabetical
    self.all.sort_by { |a| a.name}
  end
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist_name = filename[0]
    name = filename[1].split(".")[0]
    created = self.new(name, artist_name)
    created
  end
  def self.create_from_filename(filename)
    filename = filename.split(" - ")
    artist_name = filename[0]
    name = filename[1].split(".")[0]
    created = self.new(name, artist_name)
    @@all << created
    created
  end 
  def self.destroy_all
    @@all = []
  end
end
