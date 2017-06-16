class Pcategory < ApplicationRecord

  validates :name, presence: true

  has_many :programs

  extend FriendlyId
    friendly_id :name, use: :slugged
  
  def pcategory_programs
    pcategory = Pcategory.find(params[:id])
    pcategory.programs
  end

end
