class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :event_name
    	t.datetime :start_time
    	t.datetime :end_time
    	t.integer :guest_count
    	t.string :sales_person, default: 'Eddie Kayyali'
    	t.string :event_type, default: "General"
    	t.string :contact_name
    	t.string :contact_number
    	t.string :street_address
    	t.string :zipcode
    	t.string :city
    	t.string :state, default: "Florida"
    	t.decimal :price
    	t.boolean :paid, default: false
    	t.text :notes
      t.timestamps null: false
    end
  end
end
