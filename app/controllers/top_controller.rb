class TopController < ApplicationController

  def index
    @events = Event.all.order(start_datetime: :asc).feature_event.limit(5)
  end

  def terms; end

  def privacy; end

end
