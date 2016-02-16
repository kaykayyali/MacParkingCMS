class AddNumberToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :phone, :text
  end
end
