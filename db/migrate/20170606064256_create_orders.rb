class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :total, default: 0
      t.integer :user_id
      t.string :participant_name
      t.integer :participant_age
      t.string :contact_name
      t.string :contact_number

      t.timestamps
    end
  end
end
