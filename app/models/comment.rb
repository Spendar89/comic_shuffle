class Comment < ActiveRecord::Base
  attr_accessible :description, :video_id, :user_id
  belongs_to :video
  belongs_to :user, :inverse_of => :comments
end
