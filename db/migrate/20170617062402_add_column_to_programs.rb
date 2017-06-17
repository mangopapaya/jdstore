class AddColumnToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :category_id, :string
  end
end
