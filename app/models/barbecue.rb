class Barbecue < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :bookings

  validates :barbecue_model, presence: true
  validates :barbecue_type, presence: true
  validates :barbecue_price, presence: true, numericality: { only_integer: true }
  validates :barbecue_description, length: { maximum: 250 }
  validates :barbecue_location, presence: true

  geocoded_by :barbecue_location
  after_validation :geocode, if: :will_save_change_to_barbecue_location?
end
