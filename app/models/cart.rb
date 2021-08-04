class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def sum_of_price
    product.price * quantity
  end
end
