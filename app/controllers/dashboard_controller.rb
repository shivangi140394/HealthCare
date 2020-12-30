# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    current_user.role.patient? ? Patient.find_by(user_id: current_user.id) : Therapist.find_by(user_id: current_user.id)
    @patients = Patient.all
    @therapists = Therapist.all
    @current_patient = Patient.find_by_user_id(current_user.id)
    @current_therapist = Therapist.find_by_user_id(current_user.id)
    @appointments = Appointment.where(therapist_id: @current_therapist)
  end
end
