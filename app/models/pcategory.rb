class Pcategory < ApplicationRecord

  validates :name, presence: true

  has_many :programs

  def pcategory_programs
    pcategory = Pcategory.find(params[:id])
    pcategory.programs
  end

end
