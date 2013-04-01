class CreateWinecoolerAccessories < ActiveRecord::Migration
  def change
    create_table :winecooler_accessories do |t|
      t.integer :winecooler_id
      t.integer :accessory_id

      t.timestamps
    end
  end
end
