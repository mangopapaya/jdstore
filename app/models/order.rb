class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user
  has_many :program_lists

  validates :participant_name, presence: true
  validates :participant_age, presence: true
  validates :contact_name, presence: true
  validates :contact_number, presence: true

  def generate_token
    self.token = SecureRandom.uuid
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
