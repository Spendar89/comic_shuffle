class DashboardController < ApplicationController
  def index
      @top_comedians = Comedian.top_rated
      @recent_comedians = Comedian.recently_added
      @random_video = Video.first(:offset => rand(Video.count))   
  end

  def shuffle
    @random_video = Video.first(:offset => rand(Video.count))
    respond_to do |format|
      format.js{render 'shuffle.js.coffee.erb'}
    end
  end

end
