class CreateTherapists < ActiveRecord::Migration[6.0]
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :contact_no
      t.string :specialization
      t.string :age
      t.datetime :available_time
      t.string :available_days
      t.string :degree
      t.string :gender
      t.timestamps
    end
  end
end
