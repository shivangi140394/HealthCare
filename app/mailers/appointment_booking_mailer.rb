class AppointmentBookingMailer < ApplicationMailer
  def patient_appoitmemt_booking
    @patient = params[:patient]
    @therapist = params[:therapist]
    mail(from: @therapist&.email,
         to: @patient&.email,
         subject: 'Book Appointment!')
  end
end
