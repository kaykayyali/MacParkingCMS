class RenameTypeOnBookings < ActiveRecord::Migration
  def change
  	remove_column :bookings, :type
  	add_column :bookings, :booking_type, :string
  end
end
