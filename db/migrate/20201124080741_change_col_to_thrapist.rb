class ChangeColToThrapist < ActiveRecord::Migration[6.0]
  def change
  	change_column :therapists, :available_days, :string, array: true, default: [], using: "(string_to_array(available_days, ','))"
  end
end
