class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_many :cart, through: :cart_product

  scope :ordered, -> {order(position: :desc)}
end
