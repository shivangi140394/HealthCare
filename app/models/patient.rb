# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user

  has_many :appointments
  has_many :therapists, through: :appointments
  has_many_attached :images

  # validations
  validates :phone, presence: true,
                    numericality: true,
                    length: { minimum: 10, maximum: 15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
