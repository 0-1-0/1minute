class User < ActiveRecord::Base
  attr_accessible :nickname, :provider, :url, :username
end
