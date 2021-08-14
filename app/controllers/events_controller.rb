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
      end
    end
  end

  def edit
    @event = Event.find(params[:id])
    respond_to do |format|
      format.html { redirect_to root_path } 
      format.js
    end 
  end

  def update
    @event = Event.find(params[:id])
    # ストロングパラメーターからenumの値を更新できなかったので、一旦諦めました。。すみません。
    @event.update(rule: params[:event][:rule].to_i,
                  max_crews: params[:event][:max_crews],
                  start_datetime:params[:event][:start_datetime],
                  finish_datetime:params[:event][:finish_datetime],
                  message:params[:event][:message]
    )
    respond_to do |format|
      format.html { redirect_to root_path } 
      format.js
    end
  end


  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    respond_to do |format|
      format.html { redirect_to root_path } 
      format.js
    end
  end

  private

  def event_params
    params.permit(:start_datetime, :finish_datetime, :message, :max_crews).merge(rule: params[:rule].to_i)
    # params.require(:event).permit(:start_datetime, :finish_datetime, :message, :max_crews, :rule)
  end

  def edit_params
    params.require(:event).permit(:start_datetime, :finish_datetime, :message, :max_crews,:rule)
  end

  def test_params
    params.require(:event).permit(:start_datetime, :finish_datetime, :message, :max_crews)
  end
end
