class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.date :date
      t.time :time

      t.timestamps
    end
    add_index :events, [:date, :time]
  end
end
