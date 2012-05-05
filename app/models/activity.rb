class Activity < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :name, :data, :description, :image, :instantly, :minutes, :money, :activity_type

  validates_presence_of :name, :data, :description, :minutes, :money, :activity_type

  def pending_transactions
    Transaction.where(activity_id: id, status: 'pending').count
  end

  def resolve_pending(money)
    sum_minutes = 0
    sum_money = 0.0
    ev = {}

    Transaction.where(activity_id: id, status: 'pending').each do |t|
      sum_minutes += t.minutes
      sum_money   += t.money

      ev[t.event_id] = {minutes: 0, money: 0.0} unless ev[t.event_id]
      ev[t.event_id][:minutes] += t.minutes
      ev[t.event_id][:money]   += t.money

      t.status = 'done'
      t.save
    end

    rel = money / sum_money

    ev.each do |k, v|
      event = Event.find(k)
      event.current_money += v[:money] * rel
      event.current_min   += v[:minutes] * rel
      event.save
    end

  end

  def done?(user)
    return Transaction.where(activity_id: id, user_id: user.id).count > 0
  end
end
