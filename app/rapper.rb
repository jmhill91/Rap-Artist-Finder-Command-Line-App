require 'pry'
class Rapper < ActiveRecord::Base
  has_many :features
  has_many :songs, through: :features

  def find_song_by_song_name(song_name)
    found_song = Song.find_by(title: song_name)
      found_song
  end

  def self.find_feature(f_name)
    #knows who is featuring on a song given a song name
    feats = Feature.all.where(name: f_name)
    # feats.each do |song|
    #   titles =  Song.find_by(id: song.song_id)
    #     titles.title
    # end
      feats.map { |feat| feat.song.title }
  end

  def new_song(song_name, feature=nil)
    #creates new song and owns the song
    new_song = Song.create({title: song_name})
    Feature.create({name: feature, rapper_id: self.id, song_id: new_song.id})
  end

  # def find_missing_song(song_name, feature=nil)
  #     missing = find_song_by_song_name(song_name)
  #     Feature.create({name: feature, rapper_id: self.id, song_id: missing.id})
  #   end

  def all_songs
    #knows its own songs(instance method)
    my_songs = self.songs.reload
    # binding.pry
    my_songs.map do |song|
      # binding.pry
      "#{song.title}, Featuring #{song.features[0].name}"
    end
  end

  def edit_feature(song_name,feat_name)
    #can add a feature onto a song
    song = find_song_by_song_name(song_name)
    feat = Feature.find_by(song_id: song.id)
    feat.update(name: feat_name)
  end

  def delete_feature(song_name)
  #remove a feature and still have the song
  song = find_song_by_song_name(song_name)
  feat = Feature.find_by(song_id: song.id)
  feat.update(name: nil)
  end

  def delete_entire_song(song_name)
  #remove a feature and still have the song
  song = find_song_by_song_name(song_name)
  feat = Feature.find_by(song_id: song.id)
  feat.destroy
  song.destroy
  end

  def self.find_by_gender(gender)
    #return list of artist based on gender
    gend=self.all.where(gender: gender)
    gend.map do |rapper|
      rapper.name
    end
  end


  def self.find_by_region(region)
    #   #return list of artist based on region
    location=self.all.where(region: region.titleize)
    location.map do |rapper|
      rapper.name
    end
  end

end
