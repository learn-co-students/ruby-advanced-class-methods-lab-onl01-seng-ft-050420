class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    return song
  end
  
  def self.new_by_name(new_name)
    song = self.new
    song.name = new_name
    return song
  end
  
  def self.create_by_name(new_name)
    song = self.new
    song.name = new_name
    song.save
    return song
  end
  
  def self.find_by_name(name)
    return @@all.find {|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    find_by_name(name) == nil ? create_by_name(name) : find_by_name(name)
  end
  
  def self.alphabetical
    return @@all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    song.artist_name = filename.gsub(".mp3", "").split(" - ")[0]
    song.name = filename.gsub(".mp3", "").split(" - ")[1]
    return song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.gsub(".mp3", "").split(" - ")[0]
    song.name = filename.gsub(".mp3", "").split(" - ")[1]
    song.save
    return song
  end
  
  def self.destroy_all
    @@all = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
