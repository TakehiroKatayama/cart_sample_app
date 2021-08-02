class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :cart_item

  def sum_of_price
    product.price * quantity
  end
end
