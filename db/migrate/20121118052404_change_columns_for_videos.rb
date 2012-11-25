class ChangeColumnsForVideos < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.rename :league, :comedian_id
      t.remove :player1_id, :player2_id, :team1_id, :team2_id, :year
    end

  end
end
