class Api::V1::EventsController < ApplicationController
  before_action :authenticate_user!
  
  def favorite
    event = Event.find(params[:id])
    if Like.exists?(event: event)
      current_user.favorite_events.delete(event)
      render json: { status: "removed" }
    else
      current_user.favorite_events << event
      render json: { status: "added" }
    end
  end
end
