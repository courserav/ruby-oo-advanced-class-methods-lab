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

    self.all << song
    return song
  end

  def self.new_by_name(name)
    song = self.new

    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new

    song.name = name
    self.all << song
    return song
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

    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(name)

    song_array = name.split("-")
    artist_name = song_array[0].strip
    song_name = song_array[1].split(".")
    song_name = song_name[0].strip

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    return song
  end

  def self.create_from_filename(name)

    self.all << self.new_from_filename(name)
  end

  def self.destroy_all

    self.all.clear
  end

end
