class AttendingsController < ApplicationController
	before_action :check_user_login

	def create
		user_id = current_user.id
		event = Event.find_by(id: params[:event_id])
		if event.nil?
			flash[:danger] = "The event does not exist."
			redirect_to root_url
		end
		registration = EventAttending.new(event_guest_id: user_id, guest_event_id: event.id)
		if registration.save
			flash[:success] = "You have successfully confirmed your attendance!"
			redirect_to event_path(event)
		else
			flash[:danger] = "RSVP failed!"
			redirect_back(fallback_location: root_url)
		end
	end

	def destroy
		user_id = current_user.id
		registration = EventAttending.find_by(event_guest_id: user_id, guest_event_id: params[:event_id])
		if registration
			registration.delete
			flash[:success] = "RSVP successfully cancelled."
			redirect_back(fallback_location: root_url)
		end
	end

	private

		def check_user_login
  		if !logged_in?
  			flash[:info] = "You must first log in to complete this action."
  			redirect_back(fallback_location: root_url)
  		end
  	end

end
