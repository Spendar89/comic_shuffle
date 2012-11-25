class Video < ActiveRecord::Base
  attr_accessible :title, :comedian_id, :url, :ratings_count
  has_one :comedian
  belongs_to :comedian, :inverse_of => :videos
  has_many :ratings
  has_many :comments

  def random_comment
    @random_comments = []
    if self.comments.first != nil
      self.comments.all.each do |comment|
        @random_comments << comment if !comment.nil?
      end
      @random_comments.shuffle.first.description
    else
     false
    end
  end

end
