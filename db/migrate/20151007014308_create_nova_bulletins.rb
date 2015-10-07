class CreateNovaBulletins < ActiveRecord::Migration
  def change
    create_table :nova_bulletins do |t|
    	t.string :title
    	t.text   :content
    	t.string :created_by
      t.timestamps null: false
    end
  end
end
