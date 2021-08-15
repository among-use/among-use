class ParticipantsController < ApplicationController
  def index
  end

  def create
    @event = Event.find(params[:id])
    current_user.participant(@event)
    respond_to do |format|
        format.js
    end
  end

  def destroy
    event = Event.find(params[:id])
    if current_user.participant?(event)
      current_user.unparticipant(event)
      respond_to do |format|
        format.js
      end
    else
      redirect_to events_path
    end
  end

end
