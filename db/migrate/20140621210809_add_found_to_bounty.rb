class AddFoundToBounty < ActiveRecord::Migration
  def change
    add_column :bounties, :found, :boolean, default: false
  end
end
