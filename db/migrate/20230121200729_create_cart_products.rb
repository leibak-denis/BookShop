class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    change_table :cart_products do |t|
      t.integer :amount
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
