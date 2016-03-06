class RenameBookingTypeId < ActiveRecord::Migration
  def change
  	remove_index :bookings, :booking_type
  	remove_column :bookings, :booking_type
  	
  	add_column :bookings, :booking_type_id, :integer
  	add_index :bookings, :booking_type_id
  end
end
