class CreateShiftReports < ActiveRecord::Migration
  def change
    create_table :shift_reports do |t|
    	t.text :body
    	t.integer :location_id, index: true
    	t.integer :shift_id, index: true
      t.timestamps null: false
    end
  end
end
