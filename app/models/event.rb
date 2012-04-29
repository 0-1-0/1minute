class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :description, :image, :name, :target_minimum

  validates_presence_of :name, :description, :target_minimum
end
