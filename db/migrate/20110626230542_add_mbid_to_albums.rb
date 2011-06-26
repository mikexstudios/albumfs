class AddMbidToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :mbid, :string
  end

  def self.down
    remove_column :albums, :mbid
  end
end
