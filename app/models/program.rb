class Program < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :space, numericality: {greater_than_or_equal_to: 0, message: "负学位还好意思上架嘛"}

  belongs_to :pcategory
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: :slugged

  def program_pcategory
    program.program_pcategory
  end

  private
  def should_generate_new_friendly_id?
    slug.nil? || title_changed?
  end

end
