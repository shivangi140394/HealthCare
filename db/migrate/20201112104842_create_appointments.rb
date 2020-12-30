class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.bigint "patient_id"
      t.bigint "therapist_id"
      t.timestamps
    end
  end
end
