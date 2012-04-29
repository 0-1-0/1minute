class Transaction < ActiveRecord::Base
  attr_accessible :action_id, :event_id, :minutes, :money, :status, :user_id
end
