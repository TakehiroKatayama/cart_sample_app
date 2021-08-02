class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.timestamps
      t.references :product, null: false, foreign_key: true
      t.references :cart_item, null: false, foreign_key: true
    end
  end
end
