class AddDescriptionToAppointment < ActiveRecord::Migration[6.0]
  def change
		add_column :appointments, :remove_appointment, :string
  end
end
