require 'rails_helper'

describe "Event" do

  it "event can be posted to database" do
    event = Event.create(name: "test button", event_type: "click")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/events",
      :params => {"event" =>
                    {
                  "name"=> "test button",
                  "event_type"=> "click",
                  "at"=>"2020-06-12T00:00:01",
                  "button_color"=>"red"}},
      :headers => headers

    expect(request.params.keys).to include("event")
    expect(request.params["event"].keys).to include("name")
    expect(request.params["event"].keys).to include("event_type")

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(Event.all.count).to eq(2)
  end

  it "Sad path Error when unsuccesful create" do
    event = Event.create(name: "test button", event_type: "click")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/events",
      :params => {"event" =>
                    {
                  "name"=> "test button",
                  "at"=>"2020-06-12T00:00:01",
                  "button_color"=>"red"}},
      :headers => headers


    expect(Event.all.count).to eq(1)
    expect(response.status).to eq(422)
  end

  it "save event attibutes to event_attributes field in database" do
    event = Event.create(name: "test button", event_type: "click")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    post "/api/v1/events",
      :params => {"event" =>
                    {
                  "name"=> "test button",
                  "event_type"=> "click",
                  "at"=>"2020-06-12T00:00:01",
                  "button_color"=>"red"}},
      :headers => headers

    expect(Event.last.event_attributes).to include("at")
    expect(Event.last.event_attributes).to include("button_color")
    expect(response.status).to eq(200)
  end

  it "can GET events" do
    event_1 = Event.create(name: "test button", event_type: "click")
    event_2 = Event.create(name: "test button", event_type: "click", event_attributes: {"button_color"=>"red"})

    get '/api/v1/events'

    event_data = JSON.parse(response.body, symbolize_names: true)[:data]

    event_data.each do |event|
      expect(event).to have_key(:name)
      expect(event).to have_key(:event_type)
    end

    expect(event_data.last[:event_attributes]).to eq({:button_color=>"red"})
  end

  # bad Test
  it "can return events made today with count " do
    event_1 = Event.create(name: "button", event_type: "click", "created_at": "2020-06-02T19:44:51.632Z")
    event_2 = Event.create(name: "button", event_type: "click", event_attributes: {"button_color"=>"red"})
    event_3 = Event.create(name: "test button", event_type: "scroll")
    event_4 = Event.create(name: "test button", event_type: "click", event_attributes: {"button_color"=>"green"})

    get '/api/v1/events?date=today'

    event_data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(event_data.count).to eq(2)
    expect(event_data[0][:count]).to eq(2)
    expect(event_data[0][:event_type]).to eq("click")
  end
end
