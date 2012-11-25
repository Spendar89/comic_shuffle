class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.new(params[:comment])
    @comment.user_id = current_user
    if @comment.save
      respond_to do |format|
        format.js {render 'create.js.coffee.erb'}
      end
    end
  end

  def random
    @video = Video.find(params[:video_id])
    respond_to do |format|
      format.js {render 'random.js.coffee.erb'}
    end
  end


end
