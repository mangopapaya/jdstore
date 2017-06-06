class Order < ApplicationRecord
  belongs_to :user

  validates :participant_name, presence: true
  validates :participant_age, presernce: true
  validates :contact_name, presence: true
  validates :contact_number, presence: true
end
