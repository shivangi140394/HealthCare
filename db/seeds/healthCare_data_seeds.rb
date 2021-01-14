# frozen_string_literal: true'

user1 = User.create(email: 'john@gmail.com', password: '123123123', role: 'therapist')
user2 = User.create(email: 'patient@gmail.com', password: '123123123', role: 'patient')

therapist1 = Therapist.create(user_id: user1.id, name: 'john', contact_no: '1234567654', available_time_to: '10:00Am',
                 							available_time_from: '8:00PM', degree: 'MBBS', experience: '5yr', gender: 'Male',
                 							email: 'john@gmail.com', address: 'Department 98-46 Morningside Road', latitude: 23.454,
                 							longitude: 56.676)

patient1 = Patient.create(user_id: user2.id, name: 'patient', phone: '34343434',
													address: 'Unit 14 - 3 Edgar Buildings, George Street',
               						city: 'Bath', email: 'patient@gmail.com', state: 'England', gender: 'Female', description: 'cought and cold')

Appointment.create(patient_id: patient1.id, therapist_id: therapist1.id, status: 'book')
Appointment.create(patient_id: patient1.id, therapist_id: therapist1.id, status: 'confirm')

