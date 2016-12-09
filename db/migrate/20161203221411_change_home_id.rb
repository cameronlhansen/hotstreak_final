class ChangeHomeId < ActiveRecord::Migration[5.0]
  def change

    rename_column :games, :home_team_id, :favorite_id
    add_column :games, :home_team_id, :integer

  end
end
