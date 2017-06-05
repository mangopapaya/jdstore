class Reservation < ApplicationRecord
  has_many :reserved_programs
  has_many :programs, through: :reserved_programs, source: :program

  def reserve_program(program)
    ci = reserved_programs.build
    ci.program = program
    ci.slot = 1
    ci.save
  end

  def total_price
    sum = 0
    reserved_programs.each do |reserved_program|
      if reserved_program.program.price.present?
        sum += reserved_program.slot * reserved_program.program.price
      end
    end
    sum
  end

  def clean!
    reserved_programs.destroy_all
  end

end
