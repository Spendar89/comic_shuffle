class Comedian < ActiveRecord::Base
  attr_accessible :name, :bio, :photo
  has_many :videos, :dependent => :destroy, :inverse_of => :comedian

  validates :name, :format => { :with => /[A-Z][a-z\.0-9 ]*[A-Z][a-z\.0-9 ]*/, :message => "Is Not In Correct Format"}


  def rating
    @all_ratings = []
    self.videos.all.each do |video|
      @all_ratings << (video.ratings.average('thumbs')*100).to_i unless video.ratings.average('thumbs').nil?
    end
    sum = @all_ratings.inject(0) {|total, rating| total + rating}
    if @all_ratings.length == 0
      sum = 0
    else
      sum / (@all_ratings.length)
    end
  end

  def rank
    @all_comedians = []
    Comedian.all.each do |comedian|
      @all_comedians << comedian.rating
    end
    @all_comedians.sort.reverse.find_index(self.rating) + 1
  end

  def self.top_rated
    @ranked_hash, @ranked_array = {}, []
      Comedian.all.each do |comedian|
        @ranked_hash.merge!({comedian => comedian.rank}) unless Video.find(:all, :conditions => {:comedian_id => comedian.id}).empty?
      end
      @ranked_hash.sort_by {|key, value| value}.each{ |key, value| @ranked_array << key }
      @ranked_array
  end

  def self.recently_added
    Comedian.find(:all, :order => 'created_at DESC')
  end


end

