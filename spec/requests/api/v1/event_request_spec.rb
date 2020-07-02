require 'rails_helper'

describe "Event" do
  it "event can be posted to database" do
    event = Event.create(name: "test button", event_type: "click")
    headers = { "Content_Type" => "application/json", "Accept" => "application/json" }
    params
    body = {"event" : {
                 "name" : "test button",
                 "event_type" : "click",
                 "at" : "2020-06-12T00:00:01",
                 "button_color" : "red" }
               }
    post "/api/v1/events"
    # binding.pry
    :body => body,
    :headers => headers

  end
end

{"location": "Denver, CO",
  "api_key": "themuffinman",
 "controller"=>"api/v1/favorites",
 "action"=>"create",
 "user"=>{"email"=>"whatever@example.com"}}
