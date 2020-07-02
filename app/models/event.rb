class Event < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :event_type
end
