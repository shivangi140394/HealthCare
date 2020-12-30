class Patient < ApplicationRecord
  belongs_to :user

  has_many :appointments
  has_many :therapists, through: :appointments
  has_many_attached :images
end
