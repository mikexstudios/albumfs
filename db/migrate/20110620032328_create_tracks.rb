class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :album_id
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :tracks, :album_id
  end

  def self.down
    drop_table :tracks
  end
end
