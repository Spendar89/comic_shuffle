class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.string :league
      t.integer :player1_id
      t.integer :player2_id
      t.integer :team1_id
      t.integer :team2_id
      t.string :year

      t.timestamps
    end
  end
end
