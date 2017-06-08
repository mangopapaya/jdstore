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

  include AASM

  aasm do
    state :order_placed
    state :paid
    state :upcoming
    state :completed
    state :reservation_cancelled
    state :order_refunded
    state :order_charged

    event :make_payment, after_commit: :pay! do
      transitions from: :order_placed, to: :paid
    end

    event :charge_order do
      transitions from: :paid, to: :upcoming
    end

    event :deliver do
      transitions from: :upcoming, to: :completed
    end

    event :cancel_reservation do
      transitions from: [:order_placed], to: :reservation_cancelled
    end

    event :refund_order do
      transitions from: [:order_placed, :paid], to: :order_refunded
    end

  end

end
