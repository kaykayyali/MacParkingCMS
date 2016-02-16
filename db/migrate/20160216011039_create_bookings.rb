class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
    	t.references :employee, index: true
    	t.references :event, index: true
    	t.string :type
      t.timestamps null: false
    end
  end
end
