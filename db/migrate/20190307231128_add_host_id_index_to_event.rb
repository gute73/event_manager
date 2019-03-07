class AddHostIdIndexToEvent < ActiveRecord::Migration[5.2]
  def change
  	add_index :events, :host_id
  end
end
