class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :wins
      t.integer :loses
      t.string :recordats

      t.timestamps

    end
  end
end
