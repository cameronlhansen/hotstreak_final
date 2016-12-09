class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_time
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :favorite_id
      t.decimal :spread
      t.integer :final_home_score
      t.integer :final_away_score

      t.timestamps

    end
  end
end
