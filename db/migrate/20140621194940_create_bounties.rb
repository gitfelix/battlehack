class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
