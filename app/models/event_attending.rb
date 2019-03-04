class EventAttending < ApplicationRecord
	belongs_to :event_guest, :class_name => "User"
	belongs_to :guest_event, :class_name => "Event"
end
