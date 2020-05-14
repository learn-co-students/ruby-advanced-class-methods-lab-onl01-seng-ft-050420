require 'pry'
class Song
  attr_accessor :name, :artist_name


  @@all = []

  def self.all
    @@all
  end
  def self.create
    self.all << self.new
    self.all[-1]
  end
  def self.new_by_name(name) #song = Song.new_by_name("Blank Space")
    song = self.new #<random data 3493285734985>
    song.name= name #assigning the data a name
    song #return that raw object
  end

  def self.create_by_name(name_of)
    song = self.new
    song.name= name_of
    self.all << song
    song
  end

  def self.find_by_name(name_of)
    self.all.find {|person| person.name == name_of}
    #returns the object raw
  end
  def self.find_or_create_by_name(name_of)
    found = self.find_by_name(name_of)
    found == nil ? self.create_by_name(name_of) : found
  end
  # def self.find_or_create_by_name(name_of)
  #   found = self.all.find {|person| person.name == name_of} #this finds and return the object if it exist
  #   #This creates the object
  #   if found == nil
  #     song = self.new
  #     song.name= name_of
  #     self.all << song
  #     song
  #   else
  #     found
  #   end
  # end

  def self.alphabetical
    self.all.sort_by{|value| value.name}
    # sorted = []
    #
    #  self.all.each.with_index do |value, index|
    #  value.name
    #   end
    #  sorted.sort
  end
  #Song.new_from_filename("Taylor Swift - Blank Space.mp3".split(" - ")[1].chomp(".mp3"))
  def self.new_from_filename(name)
    song = self.new
    song.name= name.split(" - ")[1].chomp(".mp3")
    song.artist_name = name.split(" - ")[0]
    song
  end

  def self.create_from_filename(name)
    song = self.new
    song.name= name.split(" - ")[1].chomp(".mp3")
    song.artist_name = name.split(" - ")[0]
    self.all << song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end

# uriah = Song.new
