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

  def event_params
    params.require(:event).permit(:name, :event_type)
  end
end
