class AddNumberToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :phone, :text, null: false
  end
end
