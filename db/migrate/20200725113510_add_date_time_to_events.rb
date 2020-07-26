class AddDateTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :event_date, :date
    remove_column :events, :event_time, :time
    add_column :events, :event_date, :datetime
  end
end
