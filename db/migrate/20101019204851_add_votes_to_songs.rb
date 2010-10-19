class AddVotesToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :upvote_count, :integer
    add_column :songs, :downvote_count, :integer
  end

  def self.down
    remove_column :songs, :upvote_count, :integer
    remove_column :songs, :downvote_count, :integer
  end
end
