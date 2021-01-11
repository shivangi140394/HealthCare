# frozen_string_literal: true'

Appointment.create(patient_id: 1, therapist_id: 1, status: 'book')
Appointment.create(patient_id: 1, therapist_id: 1, status: 'confirm')
Appointment.create(patient_id: 2, therapist_id: 2, status: 'cancle')
Appointment.create(patient_id: 2, therapist_id: 2, status: 'confirm')
