class Event < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :event_type

  def self.today_stats
      select("event_type, COUNT(event_type)")
      .where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
      .group(:event_type)
  end
end

#Maybe use a scope filter
