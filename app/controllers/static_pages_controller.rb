class StaticPagesController < ApplicationController
  def home
  	@upcoming_event_feed = Event.upcoming.paginate(page: params[:page])
  end

  def about
  end
end
