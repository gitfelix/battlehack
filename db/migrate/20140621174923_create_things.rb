class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name
      t.text :description
      t.decimal :lat
      t.decimal :lng
      t.string :image

      t.timestamps
    end
  end
end
