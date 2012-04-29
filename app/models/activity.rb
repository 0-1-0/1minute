class Activity < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :data, :description, :image, :instantly, :minutes, :money, :activity_type

  validates_presence_of :data, :description, :minutes, :money, :activity_type
end
