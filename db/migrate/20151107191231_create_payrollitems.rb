class CreatePayrollitems < ActiveRecord::Migration
  def change
    create_table :payrollitems do |t|

      t.timestamps null: false
    end
  end
end
