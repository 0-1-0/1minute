class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :activity

  attr_accessible :activity_id, :event_id, :minutes, :money, :status, :user_id, :service_fee
end
