class CreateWinecoolers < ActiveRecord::Migration
  def change
    create_table :winecoolers do |t|
      t.integer :category_id
      t.string :model
      t.string :desc

      t.timestamps
    end
  end
end
