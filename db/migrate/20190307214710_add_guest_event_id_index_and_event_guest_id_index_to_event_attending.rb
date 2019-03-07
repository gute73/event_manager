class AddGuestEventIdIndexAndEventGuestIdIndexToEventAttending < ActiveRecord::Migration[5.2]
  def change
 	add_index :event_attendings, :event_guest_id
  	add_index :event_attendings, :guest_event_id
  end
end
