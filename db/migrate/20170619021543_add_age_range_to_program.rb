class AddAgeRangeToProgram < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :age_range, :string
  end
end
