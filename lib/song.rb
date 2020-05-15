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
    @@all << song 
    song
  end
  
  def self.new_by_name(names)
    song = Song.new
    song.name = names
    song
  end
  
  def self.create_by_name(names)
    song = Song.new
    song.name = names
    song.save
    song
  end
  
  def self.find_by_name(names)
    @@all.find{|song| song.name == names}
  end
  
  def self.find_or_create_by_name(names)
    if !self.find_by_name(names)
      self.create_by_name(names)
    else
      find_by_name(names)
    end
  end
      
  def self.alphabetical
     @@all.sort_by{|song| song.name}
   end
   
  def self.new_from_filename(file_name)
    song = Song.new
    file_name = file_name.split(" - ")
    song.artist_name = file_name[0]
    file_name = file_name[1].split(".")
    song.name = file_name[0]
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
