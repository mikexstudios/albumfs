class AddArtistIdIndexToAlbum < ActiveRecord::Migration
  def self.up
    add_index :albums, :artist_id
  end

  def self.down
    remove_index :albums, :artist_id
  end
end
