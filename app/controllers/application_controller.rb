class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :yt_client
  before_filter :set_admin


  private
    def set_admin
      @admin = Admin.find_by_user_id(current_user.id) if current_user !=nil
    end

    def yt_client
      @yt_client ||= YouTubeIt::Client.new(:dev_key => "AI39si7F87ZBi_Vp0PPnGiDdjGoKrEPmsVCzbQ7NQn1-1Zm9gCiKwhZIXEmaVK6ficykFRSKKBh4ekkzIwr19Ahrq72MWurw_w")
    end
end
