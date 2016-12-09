class ChangeHomeTitles < ActiveRecord::Migration[5.0]
  def change

rename_column :games, :home_team_id, :favorite_id
rename_column :games, :away_team_id, :underdog_id
rename_column :games, :favorite_id, :home_team_id
rename_column :games, :final_home_score, :final_favorite_score
rename_column :games, :final_away_score, :final_underdog_score

  end
end
