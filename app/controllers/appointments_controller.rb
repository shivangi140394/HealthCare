# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @therapist = Therapist.where(id: params[:therapist_id])
    @patient = Patient.where(id: params[:patient_id])
  end

  def create
    @appointment = Appointment.new(patient_id: params[:appointment][:patient_id],
                                   therapist_id: params[:appointment][:therapist_id],
                                   status: params[:appointment][:status])
    @appointment.save
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(status: params[:status])
    @patient = Patient.find(params[:patient_id])
    @therapist = Therapist.find(params[:therapist_id])
    AppointmentBookingMailer.with(data: @appointment, patient: @patient,
                                  therapist: @therapist).patient_appoitmemt_booking.deliver_now
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
  end

  def cancle_appointment
    binding.pry
    
  end
end
