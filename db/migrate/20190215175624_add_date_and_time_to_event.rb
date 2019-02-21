class AddDateAndTimeToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
  end
  add_index :events, [:date, :time]
end
