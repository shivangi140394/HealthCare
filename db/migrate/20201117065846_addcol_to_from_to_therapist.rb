class AddcolToFromToTherapist < ActiveRecord::Migration[6.0]
  def change
  	add_column :therapists, :available_time_to, :time
  	add_column :therapists, :available_time_from, :time
  	add_column :therapists, :experience, :integer
  	remove_column :therapists, :available_time, :datetime
  end
end
