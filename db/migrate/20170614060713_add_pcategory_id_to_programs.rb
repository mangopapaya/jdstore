class AddPcategoryIdToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :pcategory_id, :integer
  end
end
