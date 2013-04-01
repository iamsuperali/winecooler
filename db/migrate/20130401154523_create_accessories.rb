class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :model
      t.attachment :image

      t.timestamps
    end
  end
end
