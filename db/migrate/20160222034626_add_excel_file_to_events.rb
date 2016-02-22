class AddExcelFileToEvents < ActiveRecord::Migration
  def change
    add_column :events, :excel_file, :string
  end
end
