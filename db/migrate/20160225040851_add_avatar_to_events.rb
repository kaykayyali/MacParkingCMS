class AddAvatarToEvents < ActiveRecord::Migration
  def change
    add_column :events, :excelfile, :string
  end
end
