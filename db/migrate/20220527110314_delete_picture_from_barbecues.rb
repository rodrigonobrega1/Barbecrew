class DeletePictureFromBarbecues < ActiveRecord::Migration[6.1]
  def change
    remove_column :barbecues, :picture, :string
  end
end
