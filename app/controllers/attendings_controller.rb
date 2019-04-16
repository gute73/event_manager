class AttendingsController < ApplicationController
	before_action :check_user_login

	def create
		event = Event.find_by(id: params[:event_id])
		if event.nil?
			flash[:danger] = "The event does not exist."
			redirect_to root_url
    else
      current_user.attend(event)
			flash[:success] = "You have successfully confirmed your attendance!"
			redirect_to event_path(event)
		end
	end

	def destroy
    event = Event.find_by(id: params[:event_id])
    current_user.unattend(event)
		flash[:success] = "RSVP successfully cancelled."
		redirect_back(fallback_location: root_url)
	end

	private

		def check_user_login
  		if !logged_in?
  			flash[:info] = "You must first log in to complete this action."
  			redirect_back(fallback_location: root_url)
  		end
  	end

end
