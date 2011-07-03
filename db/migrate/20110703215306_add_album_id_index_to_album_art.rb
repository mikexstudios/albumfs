class AddAlbumIdIndexToAlbumArt < ActiveRecord::Migration
  def self.up
    add_index :album_arts, :album_id
  end

  def self.down
    remove_index :album_arts, :album_id
  end
end
