class Song <ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def add_artist_by_name=(artist_name)
    self.artist = Artist.find_or_create_by(:name => artist_name) unless artist_name == ""
    self.save
  end

  def genre_ids=(genre_array)
    self.song_genres.clear
    genre_array.each do |id|
      genre = Genre.find_or_create_by(id: id.to_i)
      self.song_genres.build(genre_id: genre.id)
    end
    self.save
  end

end