class CreateVinyls < ActiveRecord::Migration
  def change
    create_table :vinyls do |t|
      t.string :artist
      t.string :album
      t.string :poster
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
