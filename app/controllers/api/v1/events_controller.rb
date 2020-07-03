class Api::V1::EventsController < ApplicationController

  def create
    new_event = Event.new(event_params)
    if new_event.save
      # render json: "Success", status: 204
      render json: {status: 200, message: "Successful Post"}
    else
      render json: "Fail", status: 422
    end
  end

  def index
    events = Event.all
    today_stats = Event.today_stats

    if params[:date] == "today"
      render json: {status: 200, message: "Today's Stats", data:today_stats}
    elsif events
      render json: {status: 200, message: "Loaded Events", data:events}
    else
      render json: "Fail", status: 401
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
