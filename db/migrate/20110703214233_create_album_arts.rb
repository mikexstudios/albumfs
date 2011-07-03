class CreateAlbumArts < ActiveRecord::Migration
  def self.up
    create_table :album_arts do |t|
      t.integer :album_id
      t.string :small
      t.string :medium
      t.string :large
      t.string :extralarge
      t.string :mega

      t.timestamps
    end
  end

  def self.down
    drop_table :album_arts
  end
end
