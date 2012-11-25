class AddRatingsCountToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :ratings_count, :integer
  end
end
