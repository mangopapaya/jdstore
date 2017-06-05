class ReservedProgram < ApplicationRecord
  belongs_to :reservation
  belongs_to :program
end
