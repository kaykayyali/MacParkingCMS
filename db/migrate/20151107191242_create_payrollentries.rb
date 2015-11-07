class CreatePayrollentries < ActiveRecord::Migration
  def change
    create_table :payrollentries do |t|

      t.timestamps null: false
    end
  end
end
