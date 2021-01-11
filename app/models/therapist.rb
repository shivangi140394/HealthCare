class Therapist < ApplicationRecord
  belongs_to :user
 
  has_many :appointments
  has_many :patients, through: :appointments

  # geocoded_by :address
  # after_validation :geocode

  def coordinates
    [longitude, latitude]
  end

  def to_feature
    {
      "type": 'Feature',
      "geometry": {
        "type": 'Point',
        "coordinates": coordinates
      },
      "properties": {
        "therapist_id": id,
        "name": name,
        "info_window": ApplicationController.new.render_to_string(
          partial: 'therapists/infowindow',
          locals: { therapist: self }
        )
      }
    }
  end
end
