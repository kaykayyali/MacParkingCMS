class AddColumnsToNoteLocationAndType < ActiveRecord::Migration
  def change
  	add_column :note_types, :name, :string
  	add_column :note_locations, :name, :string
  	remove_column :notes, :type, :string
  	remove_column :notes, :location, :string
  	add_reference :notes, :note_type, index: true
  	add_reference :notes, :note_location, index: true
  end
end
