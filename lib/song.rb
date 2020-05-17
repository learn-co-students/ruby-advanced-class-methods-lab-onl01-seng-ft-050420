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
    song = Song.new #initializes a song
    song.save #saves it to all (you can do it literally or through song.all)
    song #returns song instance that was initialized and save
  end

  def self.new_by_name(song_name)#takes in the string of names
  song = self.new ##should return an instance of Song and NOT  a simple string
  song.name = song_name #returns a song instance with that name set as the name property
  song 
  end

  def self.create_by_name(song_name)#takes in the string name of a song
  song = self.create #song being saved into the @all class variable
  song.name = song_name 
  song #returns a song instance with that name set as it is name property
  end

  def self.find_by_name(song_name)#accepts the string name of a song
  self.all.detect{|s| s.name == song_name} #returns the matching instance of the song with name
  end

  def self.find_or_create_by_name(song_name)#accept a string name and either:
    #return a matching song instance with that name OR
    #create a new song with the name AND return the song instance
    self.find_by_name(song_name) || self.create_by_name(song_name)
    # results = self.find_by_name(song_name)
    # if results
    #   binding.pry
    #   results 
    # else 
    #   self.create_by_name(song_name)
    # end
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name} #returns all the songs in (a-z) order *use: array#sort_by
  end

  def self.new_from_filename(filename) #accepts a filename
  array = filename.split(" - ")  #format to "#{artist}-#{song_name}.mp3"
  array[1] = array[1].chomp(".mp3")
  song = self.new
  song.name = array[1]
  song.artist_name = array [0]
  song 
  end

  def self.create_from_filename(filename)
  results = self.new_from_filename(filename) #pass the file name correctly, but should save the song instance that was created
  song = self.create 
  song.name = results.name 
  song.artist_name = results.artist_name 
  song 
  end

  def self.destroy_all
  self.all.clear #reset the state of the @@all class variable to empty array
  end
end
