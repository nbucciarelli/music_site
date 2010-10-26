class Song < ActiveRecord::Base
  belongs_to :user
  before_create :set_vote_defaults
  
  GENRES = ["Rock", "Rap", "Punk", "Disco", "Hip Hop"]
  
  serialize :users_upvoted
  serialize :users_downvoted

  def set_vote_defaults
    self.users_upvoted = ['']
    self.users_downvoted = ['']
    self.downvote_count = 0
    self.upvote_count = 0
  end

end
