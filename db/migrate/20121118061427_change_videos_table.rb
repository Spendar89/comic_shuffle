class ChangeVideosTable < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.remove :comedian_id
      t.integer :comedian_id
    end
  end
end
