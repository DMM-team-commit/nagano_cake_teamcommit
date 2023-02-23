class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { no_making: 0, to_be_made: 1, making: 2, made: 3 }

  def subtotal
    price*amount
  end
end
