class AddUserIdToPatients < ActiveRecord::Migration[6.0]
  def change
  	add_column :patients, :user_id, :bigint
  	add_column :patients, :email, :string
  	add_column :therapists, :user_id, :bigint
  	add_column :therapists, :email, :string
  end
end
