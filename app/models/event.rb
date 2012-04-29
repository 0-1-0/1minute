class Event < ActiveRecord::Base
  attr_accessible :current_min, :current_money, :description, :image_id, :name, :target_minimum
end
