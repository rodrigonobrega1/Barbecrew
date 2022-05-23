class CreateBarbecues < ActiveRecord::Migration[6.1]
  def change
    create_table :barbecues do |t|
      t.string :barbecue_model
      t.string :barbecue_type
      t.integer :barbecue_price
      t.text :barbecue_description
      t.string :barbecue_location

      t.timestamps
    end
  end
end
