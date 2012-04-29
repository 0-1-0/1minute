class Action < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :data, :description, :image, :instantly, :minutes, :money, :type

  validates_presence_of :data, :description, :minutes, :money, :type
end
