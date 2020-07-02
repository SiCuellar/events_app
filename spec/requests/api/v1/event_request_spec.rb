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
    expect(response.status).to eq(204)
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
end
