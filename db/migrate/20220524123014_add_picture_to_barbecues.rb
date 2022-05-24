class AddPictureToBarbecues < ActiveRecord::Migration[6.1]
  def change
    add_column :barbecues, :picture, :poster_url
  end
end
