class FixDateOnEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :start_time
  	remove_column :events, :end_time
  	add_column :events, :start_time, :time
  	add_column :events, :end_time, :time
  	add_column :events, :date, :date
  end
end
