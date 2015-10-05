class RemoveAndAddToApplications < ActiveRecord::Migration
  def change
  	remove_column :applications, :city
  	remove_column :applications, :state
  	remove_column :applications, :zipcode
  end
end
