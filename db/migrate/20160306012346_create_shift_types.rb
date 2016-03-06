class CreateShiftTypes < ActiveRecord::Migration
  def change
    create_table :shift_types do |t|
    	t.string :type 
    	t.decimal :rate
    	t.integer :location_id, index: true
      t.timestamps null: false
    end
  end
end
