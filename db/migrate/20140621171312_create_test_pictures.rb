class CreateTestPictures < ActiveRecord::Migration
  def change
    create_table :test_pictures do |t|
      t.string :name
      t.text   :description
      t.string :image
      
      t.timestamps
    end
  end
end
