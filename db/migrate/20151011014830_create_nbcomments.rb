class CreateNbcomments < ActiveRecord::Migration
  def change
    create_table :nbcomments do |t|
    	t.text :content
    	t.references :user, index: true
    	t.references :nova_bulletin, index: true
      t.timestamps null: false
    end
  end
end
