class ChangeKindToNameForShiftType < ActiveRecord::Migration
  def change
  	remove_column :booking_types, :kind
  	remove_column :shift_types, :kind
  	add_column :booking_types, :name, :string
  	add_column :shift_types, :name, :string
  end
end
