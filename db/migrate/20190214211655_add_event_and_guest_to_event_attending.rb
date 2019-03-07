class AddEventAndGuestToEventAttending < ActiveRecord::Migration[5.2]
  def change
    add_column :event_attendings, :event_guest_id, :integer
    add_column :event_attendings, :guest_event_id, :integer
  end
end
