class Appointment < ApplicationRecord
  extend Enumerize

  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
  enumerize :weekdays, in: DAYS, multiple: true, default: -> { default_weekdays }

  STATUS = %w[book confirm cancle].freeze
  enumerize :status, in: STATUS, default: STATUS.first, predicates: true, scope: true
  validates :status, inclusion: { in: STATUS }, presence: true

  attr_accessor :name, :specialization, :time_to, :time_from, :description

  belongs_to :therapist
  belongs_to :patient, optional: true

  class << self
    private

    def default_weekdays
      %w[Monday Tuesday Wednesday Thursday Friday]
    end
  end
end
