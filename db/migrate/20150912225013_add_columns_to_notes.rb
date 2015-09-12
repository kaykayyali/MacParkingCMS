class AddColumnsToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :location, :string
  	add_column :notes, :type, :string
  end
end
