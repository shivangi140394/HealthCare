class AppointmentBookingMailer < ApplicationMailer
  
  def patient_appoitmemt_booking
    @patient = params[:patient]
    @therapist = params[:therapist]
    mail(from: @therapist&.email,
         to: @patient&.email,
         subject: 'Book Appointment!')
  end

  def cancle_appointment_booking
    @patient = params[:patient]
    @therapist = params[:therapist]
    @appointment = params[:data]
    mail(from: @therapist&.email,
         to: @patient&.email,
         subject: 'You Appointment will Cancle!')
  end
end
