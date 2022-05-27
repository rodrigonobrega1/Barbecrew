class Booking < ApplicationRecord
  belongs_to :barbecue
  belongs_to :user

  validates :date_in, presence: true
  validates :date_out, presence: true

end
