class AddCoordinatesToBarbecue < ActiveRecord::Migration[6.1]
  def change
    add_column :barbecues, :latitude, :float
    add_column :barbecues, :longitude, :float
  end
end
