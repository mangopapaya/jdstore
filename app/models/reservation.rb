class Reservation < ApplicationRecord
  has_many :reserved_programs
  has_many :programs, through: :reserved_programs, source: :program

  def reserve_program(program)
    ci = reserved_programs.build
    ci.program = program
    ci.space = 1
    ci.save
  end
end
