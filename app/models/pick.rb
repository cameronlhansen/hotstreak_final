class Pick < ActiveRecord::Base

  validates :user_id, :uniqueness => { :scope => [:game_id] }

  validates :user_id, :presence => true
  validates :game_id, :presence => true
  validates :pick_id, :presence => true

  belongs_to :user
  belongs_to :game


end
