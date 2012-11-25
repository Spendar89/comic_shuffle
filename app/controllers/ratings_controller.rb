class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    @rating = @video.ratings.new(:thumbs => params[:thumbs], :user_id => current_user.id)
    if @rating.save
      respond_to do |format|
        format.js{render 'create.js.coffee.erb'}
      end
    else
      respond_to do |format|
        format.js {render 'errors.js.coffee.erb'}
      end
    end
  end

end
