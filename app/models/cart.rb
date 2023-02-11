class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def total
    # cart_products.to_a.sum { |cart_product| cart_product.total }
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.total
    end
    return total
  end
end
