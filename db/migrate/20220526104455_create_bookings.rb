class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :date_in
      t.date :date_out
      t.references :barbecue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
