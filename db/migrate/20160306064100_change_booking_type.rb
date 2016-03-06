class ChangeBookingType < ActiveRecord::Migration
  def change
  	remove_column :booking_types, :type
  	add_column :booking_types, :kind, :string
  end
end
