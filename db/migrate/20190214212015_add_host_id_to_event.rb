class AddHostIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :host_id, :integer
  end
  add_index :events, :host_id
end
