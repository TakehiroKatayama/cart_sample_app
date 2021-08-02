class CartItem < ApplicationRecord
  has_many :carts, dependent: :destroy

end
