class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.string :subject
    	t.text :content
    	t.date :date
    	t.references :user, index: true
      t.timestamps null: false
    end
  end
end
