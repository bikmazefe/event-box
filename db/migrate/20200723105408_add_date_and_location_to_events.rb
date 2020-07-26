class AddDateAndLocationToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_date, :date
    add_column :events, :event_time, :time 
    add_column :events, :event_name, :string
    add_column :events, :event_description, :text
  end
end
