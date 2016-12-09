class Game < ActiveRecord::Base

  validates :favorite_id, :presence => true
  validates :underdog_id, :presence => true
  validates :home_team_id, :presence => true
  validates :game_date, :presence => true
  validates :game_time, :presence => true
  validates :spread, :presence => true


  has_many   :picks,
             :dependent => :destroy

end
