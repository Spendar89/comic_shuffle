class ComediansController < ApplicationController
  def show
    @comedian = Comedian.find(params[:id])
    @videos = @comedian.videos.all
    if params[:video_id].nil?
      @start_video = @comedian.videos.first
    else
      @start_video = @comedian.videos.find(params[:video_id])
    end
  end

  def update
    @comedian = Comedian.find(params[:id])
    if @comedian.update_attributes(params[:comedian])
      respond_to do |format|
        format.js { render 'update.js.coffee.erb' }
      end
    end
  end


end
