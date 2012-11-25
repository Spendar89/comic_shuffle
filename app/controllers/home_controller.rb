class HomeController < ApplicationController

  def index
    if user_signed_in?
      if !@admin.nil?
        redirect_to :controller => 'admin', :action => 'index'
      else
        redirect_to :controller => 'dashboard', :action => 'index'
      end
    end
  end

end
