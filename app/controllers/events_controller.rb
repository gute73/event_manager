class EventsController < ApplicationController
	before_action :check_user_login
	before_action :check_correct_user, only: :destroy

  def show
  	@event = Event.find_by(id: params[:id])
  end

  def new
  	@event = current_user.hosted_events.build
  end

  def create
  	@event = current_user.hosted_events.build(event_params)
  	if @event.save
  		flash[:success] = "Event successfully created!"
  		redirect_to @event
  	else
  		flash.now[:danger] = "Event creation failed."
  		render 'new'
  	end
  end

  def destroy
  	@event.destroy
  	flash[:success] == "Event successfully removed."
  	redirect_to root_url
  end

  private

  	def event_params
  		params.require(:event).permit(:title, :description, :date, :time, :location)
  	end

  	def check_user_login
  		if !logged_in?
  			flash[:info] = "You must first log in to complete this action."
  			redirect_back(fallback_location: root_url)
  		end
  	end

  	def check_correct_user
  		@event = Event.find_by(id: params[:id])
  		if !current_user.event_creator?(@event.host)
  			flash[:danger] = "You may only delete an event that you created."
  			redirect_back(fallback_location: root_url)
  		end
  	end

end
