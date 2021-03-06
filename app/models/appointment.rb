class Appointment < ApplicationRecord
  extend Enumerize

  DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
  enumerize :weekdays, in: DAYS, multiple: true, default: -> { default_weekdays }

  STATUS = %w[book confirm cancel].freeze
  enumerize :status, in: STATUS, default: STATUS.first, predicates: true, scope: true
  validates :status, inclusion: { in: STATUS }, presence: true

  attr_accessor :name, :specialization, :time_to, :time_from, :description

  belongs_to :therapist
  belongs_to :patient, optional: true

  scope :manager_by_status, lambda { |therapist_id, status|
    where('therapist_id = ? AND status = ?', therapist_id, status)
  }

  class << self
    private

    def default_weekdays
      %w[Monday Tuesday Wednesday Thursday Friday]
    end
  end
end
