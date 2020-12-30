class AddStatusToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :status, :string
  end
end
