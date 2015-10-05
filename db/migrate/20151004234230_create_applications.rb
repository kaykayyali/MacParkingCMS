class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :phone
    	t.string :has_car
    	t.string :street_address
    	t.string :zipcode
    	t.string :email
    	t.string :city
    	t.string :state
      t.timestamps null: false
    end
  end
end
