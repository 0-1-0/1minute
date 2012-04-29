class Action < ActiveRecord::Base
  attr_accessible :data, :description, :image_id, :instantly, :minutes, :money, :type

  validates_presence_of :data, :description, :minutes, :money, :type
end
