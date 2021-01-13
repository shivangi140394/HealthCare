# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    current_user.role.patient? ? Patient.find_by(user_id: current_user.id) : Therapist.find_by(user_id: current_user.id)
    @patients = Patient.all
    @therapists = Therapist.all
    current_login_user
    @appointments = Appointment.where(therapist_id: @current_therapist)
  end
end
