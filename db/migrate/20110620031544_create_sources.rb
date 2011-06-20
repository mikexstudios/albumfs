class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.integer :album_id
      t.string :type
      t.string :url

      t.timestamps
    end
    add_index :sources, :album_id
  end

  def self.down
    drop_table :sources
  end
end
