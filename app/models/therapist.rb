class Therapist < ApplicationRecord
  belongs_to :user

  has_many :appointments
  has_many :patients, through: :appointments

  # validations
  validates :contact_no, presence: true,
							numericality: true,
              length: { minimum: 10, maximum: 15 }
  validates :experience, presence: true
  validates :degree, presence: true
  validates :specialization, presence: true
end
