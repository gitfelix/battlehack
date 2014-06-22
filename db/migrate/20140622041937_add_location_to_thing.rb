class AddLocationToThing < ActiveRecord::Migration
  def change
    add_column :things, :location, :string
  end
end
