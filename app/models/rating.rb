class Rating < ActiveRecord::Base
  attr_accessible :thumbs, :video_id, :user_id
  belongs_to :video, :counter_cache => true

  validates_uniqueness_of :video_id, :scope => :user_id, :message => "You've already rated this video"
end
