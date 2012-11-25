class ComediansController < ApplicationController
  def show
    @comedian = Comedian.find(params[:id])
    @videos = @comedian.videos.all
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
