class AddPhotoToComedians < ActiveRecord::Migration
  def change
    add_column :comedians, :photo, :string
  end
end
