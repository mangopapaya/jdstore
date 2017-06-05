class Reservation < ApplicationRecord
  has_many :reserved_programs
  has_many :programs, through: :reserved_programs, sources: :program

  def reserve_program(program)
    ci = reserved_programs.build
    ci.program = program
    ci.slot = 1
    ci.save
  end
end
