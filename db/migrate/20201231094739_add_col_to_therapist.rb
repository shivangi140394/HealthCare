class AddColToTherapist < ActiveRecord::Migration[6.0]
  def change
  	add_column :therapists, :address, :string
  	add_column :therapists, :latitude, :float
  	add_column :therapists, :longitude, :float
  end
end
