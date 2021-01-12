# frozen_string_literal: true'

User.create(id: 1, email: 'john@gmail.com', password: '123123123', role: 'therapist')
User.create(id: 2, email: 'bob@gmail.com', password: '123123123', role: 'therapist')
User.create(id: 3, email: 'patient@gmail.com', password: '123123123', role: 'patient')
User.create(id: 4, email: 'leena@gmail.com', password: '123123123', role: 'patient')

Therapist.create(user_id: 1, name: 'john', contact_no: '1234567654', available_time_to: '10:00Am',
                 available_time_from: '8:00PM', degree: 'MBBS', experience: '5yr', gender: 'Male',
                 email: 'john@gmail.com', address: 'Department 98-46 Morningside Road', latitude: 23.454,
                 longitude: 56.676)
Therapist.create(user_id: 2, name: 'Bob', contact_no: '3433567654', available_time_to: '10:00Am',
                 available_time_from: '8:00PM', degree: 'MBBS', experience: '8yr', gender: 'Male',
                 email: 'bob@gmail.com', address: 'Office 33-27 Colmore Row, Birmingham, England',
                 latitude: 23.454, longitude: 56.676)

Patient.create(user_id: 3, name: 'patient', phone: '34343434', address: 'Unit 14 - 3 Edgar Buildings, George Street',
                city: 'Bath', email: 'patient@gmail.com', state: 'England', gender: 'Female', description: 'cought and cold')
Patient.create(user_id: 4, name: 'leena', phone: '5435435434', address: 'Unit 141 - 56 George Street',
                city: 'Bath', email: 'leena@gmail.com', state: 'England', gender: 'Female', description: 'cought and cold')

Appointment.create(patient_id: 2, therapist_id: 1, status: 'book')
Appointment.create(patient_id: 1, therapist_id: 2, status: 'confirm')
Appointment.create(patient_id: 1, therapist_id: 2, status: 'confirm')

