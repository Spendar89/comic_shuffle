class VideosController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  end

  def create
    @video = Video.new(:comedian_id => params[:comedian_id], :title => params[:title], :url => params[:url])
    @counter = params[:counter]
    if @video.save
      respond_to do |format|
        format.js {render 'create.js.coffee.erb'}
      end
    end
  end


  def show
    @comedian = Comedian.find(params[:comedian_id])
    @video = @comedian.videos.find(params[:id])
    respond_to do |format|
      format.js {render 'show.js.coffee.erb'}
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
