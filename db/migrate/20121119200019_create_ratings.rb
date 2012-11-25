class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :video_id
      t.integer :thumbs

      t.timestamps
    end
  end
end
