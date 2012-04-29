class Action < ActiveRecord::Base
  attr_accessible :data, :description, :image_id, :instantly, :minutes, :money, :type
end
