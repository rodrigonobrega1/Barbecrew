class Booking < ApplicationRecord
  belongs_to :barbecue
  belongs_to :user
end
