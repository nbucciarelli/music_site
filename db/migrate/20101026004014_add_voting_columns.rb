class AddVotingColumns < ActiveRecord::Migration
  def self.up
    add_column :users, :songs_upvoted, :text
    add_column :users, :songs_downvoted, :text
    add_column :songs, :users_upvoted, :text
    add_column :songs, :users_downvoted, :text
  end

  def self.down
    remove_column :users, :upvoted
    remove_column :users, :downvoted
    remove_column :songs, :users_upvoted
    remove_column :songs, :users_downvoted
  end
end
