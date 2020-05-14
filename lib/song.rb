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
    song = self.new
    song.save
    song.name = song_name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    data = []
    file.split(/[-.]/).each do |word|
      data << word.strip
    end
    song = self.new
    song.name = data[1]
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    @@all = []
  end
end
