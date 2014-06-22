class AddPriceToThing < ActiveRecord::Migration
  def change
    add_column :things, :price, :decimal
  end
end
