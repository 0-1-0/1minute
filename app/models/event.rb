class Event < ActiveRecord::Base
  attr_accessible :description, :image_id, :name, :target_minimum

  validates_presence_of :name, :description, :target_minimum
end
