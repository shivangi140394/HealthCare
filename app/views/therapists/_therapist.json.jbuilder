# frozen_string_literal: true

json.extract! therapist, :id, :user_id, :name, :contact_no, :specialization,
                        :age, :available_time_to, :available_time_from,
                        :degree, :experience, :gender, :email, :address,
                        :latitude, :longitude, :created_at, :updated_at
json.url therapist_url(therapist, format: :json)
