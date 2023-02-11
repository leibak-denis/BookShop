class AddAmountToCartProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_products, :amount, :integer
  end
end
