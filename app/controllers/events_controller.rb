class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:event_id])
    respond_to do |format|
      if @event
        # format.html { redirect_to root_path }
        format.js { @event }
      else
        redirect_back fallback_location: events_path
      end
    end
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      respond_to do |format|
        format.html { redirect_to root_path } 
        format.js
      end  #create.js.erbを探してその中の処理を実行する
    end
  end

  def edit
  end

  def destroy
  end

  private

  def event_params
    params.permit(:start_datetime, :finish_datetime, :message, :max_crews).merge(rule: params[:rule].to_i)
  end
end
