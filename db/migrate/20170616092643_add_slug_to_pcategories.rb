class AddSlugToPcategories < ActiveRecord::Migration[5.0]
  def change
    add_column :pcategories, :slug, :string
  end
end
