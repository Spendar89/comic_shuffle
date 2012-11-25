class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    unless !@admin.nil?
        redirect_to dashboard_index_path(current_user.id)
        flash[:alert] = "You do not have access to this page"
    end
    @comedians = Comedian.all
  end

  def search
    @results = []
    if !Comedian.find_by_name(params[:query]).nil?
      @comedian = Comedian.find_by_name(params[:query])
    else
      @comedian = Comedian.new(:name => params[:query])
    end
    if @comedian.save
      10.times do |i|
        @results << yt_client.videos_by(:page => i, :query => params[:query], :per_page => 50,
                                      :duration => "short", :tags => ["stand-up"], :categories => [:comedy],
                                      :fields => { :published => (Date.new(2010)..Date.today) }).videos
      end
    end
    respond_to do |format|
      format.js {render 'search.js.coffee.erb'}
    end
  end


  def show
  end



end
