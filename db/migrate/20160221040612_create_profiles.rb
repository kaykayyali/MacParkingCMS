class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.references :user , index: true
    	t.references :employee, index: true
      t.timestamps null: false
    end
  end
end
