class Api::V1::EventsController < ApplicationController

  def create
    new_event = Event.new(event_params)
    if new_event.save
      render json: "Success", status: 204
    else
      render json: "Fail", status: 422
    end
  end

  private

# There is a better way to solve this without using the permit!
#not safe to allow everything (come back to refactor)
  def event_params
    cleaned_params = {}
    cleaned_params["event_attributes"] = {}

    original_params = params.require(:event).permit!

    original_params.each do |k,v|
      if (k == "name" || k == "event_type")
        cleaned_params[k] = v
      else
        cleaned_params["event_attributes"][k] = v
      end
    end

    cleaned_params
  end
end
