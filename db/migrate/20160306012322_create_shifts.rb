class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
    	t.time :start_time
    	t.time :end_time
    	t.integer :employee_id, index: true
    	t.integer :shift_type_id, index: true
    	t.integer :location_id, index: true
      t.timestamps null: false
    end
  end
end
