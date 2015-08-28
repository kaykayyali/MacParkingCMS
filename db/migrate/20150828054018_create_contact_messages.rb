class CreateContactMessages < ActiveRecord::Migration
  def change
    create_table :contact_messages do |t|

      t.timestamps null: false
    end
  end
end
