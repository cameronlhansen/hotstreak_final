class Team < ActiveRecord::Base
  validates :name, :uniqueness => true

  has_many   :games,
               :dependent => :destroy

end
