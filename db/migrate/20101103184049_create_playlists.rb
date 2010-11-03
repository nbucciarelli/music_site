class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.string :playlist_title
      t.text :playlist_description
      t.integer :user_id
      t.text :song_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :playlists
  end
end
