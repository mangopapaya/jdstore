class CreateProgramLists < ActiveRecord::Migration[5.0]
  def change
    create_table :program_lists do |t|
      t.integer :order_id
      t.string :program_name
      t.string :program_category
      t.integer :program_price
      t.integer :slot
      
      t.timestamps
    end
  end
end
