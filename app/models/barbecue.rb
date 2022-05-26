class Barbecue < ApplicationRecord

  has_one_attached :picture
  belongs_to :user
  has_many :bookings

  geocoded_by :barbecue_location
  after_validation :geocode, if: :will_save_change_to_barbecue_location?

end
