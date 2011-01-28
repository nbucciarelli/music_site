class AddLinkToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :link, :string
  end

  def self.down
    remove_column :songs, :link
  end
end
