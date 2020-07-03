require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:event_type)}
  end

  describe 'Business Logic' do
    it 'today_stats' do
      event_1 = Event.create(name: "button", event_type: "click", "created_at": "2020-06-02T19:44:51.632Z")
      event_2 = Event.create(name: "button", event_type: "scroll", "created_at": "2020-07-02T19:44:51.632Z")
      event_3 = Event.create(name: "large button", event_type: "scroll", "created_at": "2020-07-02T19:44:51.632Z")
      event_4 = Event.create(name: "button", event_type: "pass", "created_at": "2020-07-02T19:44:51.632Z")
      # event_4 = Event.create(name: "button", event_type: "click", event_attributes: {"button_color"=>"red"})
      # event_5 = Event.create(name: "test button", event_type: "scroll")
      # event_6 = Event.create(name: "test button", event_type: "click", event_attributes: {"button_color"=>"green"})

      stats = Event.today_stats
      # binding.pry
      # expect(stats.count).to eq(3)
    end
  end
end
