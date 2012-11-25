class ChangePlayersTableToComedians < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.remove :team_id
      t.string :name
    end
    rename_table('players', 'comedians')
  end
end
