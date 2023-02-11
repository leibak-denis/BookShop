class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total
    product.price * amount
  end
end
