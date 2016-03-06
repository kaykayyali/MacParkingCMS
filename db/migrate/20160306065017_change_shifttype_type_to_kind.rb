class ChangeShifttypeTypeToKind < ActiveRecord::Migration
  def change
  	remove_column :shift_types, :type 
  	add_column :shift_types, :kind, :string
  end
end
