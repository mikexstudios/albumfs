class AddAlbumArtForExistingAlbums < ActiveRecord::Migration
  def self.up
    Album.find_each do |album|
      album.create_album_art if album.album_art.nil?
    end
  end

  def self.down
    # WARNING: If we already have existing album_art that was NOT added in `up`, 
    # then this `down` will still delete it. Use with caution.
    Album.find_each do |album|
      album.album_art.delete if not album.album_art.nil?
    end
  end
end
