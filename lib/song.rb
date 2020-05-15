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
    @@all << self.new
    @@all[-1]
  end
  
  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    new_song = self.new
    new_song.name= name
    @@all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    
    if  self.find_by_name(name)
      self.find_by_name(name)
      
    else
     self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|word| word.name}
  end
  
  def self.new_from_filename(filename)
    new_array= filename.split(" - ")
    artist_name= new_array[0]
    name = new_array[1].gsub(".mp3","")
    
    song= self.new
    song.name = name
    song.artist_name = artist_name
    
    song
  end

  
  def self.create_from_filename(filename)
    new_array= filename.split(" - ")
    artist_name= new_array[0]
    name = new_array[1].gsub(".mp3","")
    
    song= self.create
    song.name = name
    song.artist_name= artist_name
    song
    
  end
  
  def self.destroy_all
    @@all.clear
  end
end
