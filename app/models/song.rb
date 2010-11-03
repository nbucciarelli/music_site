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
  
  def upvote(user)
    unless self.users_upvoted.include?(user.id) || self.users_downvoted.include?(user.id)
      self.users_upvoted << user.id
      self.upvote_count += 1
      true
    else
      false
    end
    
  end
  
  def downvote(user)
    unless self.users_upvoted.include?(user.id) || self.users_downvoted.include?(user.id)
      self.users_downvoted << user.id
      self.downvote_count += 1
      true
    else
      false
    end
  end

end
