class Admin < ActiveRecord::Base
  attr_accessor :query
  attr_accessible :user_id


end

