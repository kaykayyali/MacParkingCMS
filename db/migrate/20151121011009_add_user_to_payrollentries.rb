class AddUserToPayrollentries < ActiveRecord::Migration
  def change
  	add_column :payrollentries, :creator_id, :integer
  end
end
