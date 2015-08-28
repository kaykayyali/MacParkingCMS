class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|
    	t.string :name
    	t.string :email
    	t.string :phone
    	t.text :content
    	t.boolean :read, default: false
      t.timestamps null: false
    end
  end
end
