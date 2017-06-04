class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :category
      t.text :description
      t.integer :space
      t.integer :price

      t.timestamps
    end
  end
end
