class CreateBookingTypes < ActiveRecord::Migration
  def change
    create_table :booking_types do |t|
    	t.string :type
      t.timestamps null: false
      remove_column :bookings, :booking_type
      add_column :bookings, :booking_type, :integer
      add_index :bookings, :booking_type
    end
  end
end
