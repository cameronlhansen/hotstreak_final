class ChangeTimeDateOnGames < ActiveRecord::Migration[5.0]
  def change
      add_column :games, :game_time, :time
      add_column :games, :game_date, :date

      remove_column :games, :date_time

  end
end
