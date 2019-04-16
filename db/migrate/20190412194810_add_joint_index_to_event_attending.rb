class AddJointIndexToEventAttending < ActiveRecord::Migration[5.2]
  def change
    add_index :event_attendings, [:event_guest_id, :guest_event_id], unique: true
  end
end
