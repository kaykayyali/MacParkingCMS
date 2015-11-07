class AddColumnsToPayroll < ActiveRecord::Migration
  def change
  	add_column :payrollentries, :week_start_date, :date
  	add_column :payrollentries, :week_end_date, :date
  	add_column :payrollentries, :submission_date, :date
  	add_column :payrollentries, :gross_total, :decimal
  	add_column :payrollentries, :net_total, :decimal
  	add_column :payrollitems, :name_of_employee, :string
  	add_column :payrollitems, :gross_pay, :decimal
  	add_column :payrollitems, :net_pay, :decimal
  	add_column :payrollitems, :medicare_tax, :decimal
  	add_column :payrollitems, :employers_tax, :decimal
  	add_reference :payrollitems, :payrollentry, index: true 
  end
end
