class CreateNoteLocations < ActiveRecord::Migration
  def change
    create_table :note_locations do |t|

      t.timestamps null: false
    end
  end
end
