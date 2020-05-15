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
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    result = nil
    @@all.each do |song|
      if name == song.name
        result = song
      end
    end
    result
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(mp3)
    mp3= mp3.split(" - ")
    new_song = self.new
    new_song.name = mp3[1].chomp(".mp3")
    new_song.artist_name = mp3[0]
    new_song
  end

  def self.create_from_filename(mp3)
    self.new_from_filename(mp3).save
  end

  def self.destroy_all
    @@all.clear
  end
end
