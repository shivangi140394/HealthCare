# frozen_string_literal: true

class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
    if params[:locale].present?
      @therapist_appointments = Appointment.manager_by_status(params[:therapist_id], params[:locale])
    else
      @therapist_appointments = Appointment.where(therapist_id: params[:therapist_id])
    end
    current_login_user
  end

  def show
    @appointment = Appointment.find(params[:id])
    current_login_user
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
    redirect_back fallback_location: @appointment
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
    @appointment = Appointment.find(params[:id])
  end

  def cancle
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.update(status: params[:appointment][:status],
                        remove_appointment: params[:appointment][:remove_appointment])
    @patient = Patient.find(params[:appointment][:patient_id])
    @therapist = Therapist.find(params[:appointment][:therapist_id])
    AppointmentBookingMailer.with(data: @appointment, patient: @patient,
                                  therapist: @therapist).cancle_appointment_booking.deliver_now
    redirect_back fallback_location: @appointment
  end
end
