class AddEmailToThing < ActiveRecord::Migration
  def change
     add_column :things, :email, :string
  end
end
