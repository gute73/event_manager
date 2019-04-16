class EventAttending < ApplicationRecord
	belongs_to :event_guest, :class_name => "User"
	belongs_to :guest_event, :class_name => "Event"
  validates :event_guest, presence: true
  validates :guest_event, presence: true
end
