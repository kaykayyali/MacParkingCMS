class AddRefToPayrollentries < ActiveRecord::Migration
  def change
  	remove_column :payrollentries, :creator_id
  	add_reference :payrollentries, :user, index: true
  end
end
