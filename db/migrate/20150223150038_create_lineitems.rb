class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :vinyl_id
      t.integer :order_id
      t.integer :quantity
      t.integer :cart_id

      t.timestamps
    end
  end
end
