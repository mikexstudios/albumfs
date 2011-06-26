class RenameNameToTitleInAlbums < ActiveRecord::Migration
  def self.up
    rename_column :albums, :name, :title
  end

  def self.down
    rename_column :albums, :title, :name
  end
end
