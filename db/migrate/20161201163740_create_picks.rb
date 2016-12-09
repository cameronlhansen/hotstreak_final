class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :pick_id
      t.string :final_result

      t.timestamps

    end
  end
end
