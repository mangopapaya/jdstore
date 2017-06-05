class CreateReservedPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :reserved_programs do |t|
        t.integer :reservation_id
        t.integer :program_id
        t.integer :slot, default: 1
      t.timestamps
    end
  end
end
