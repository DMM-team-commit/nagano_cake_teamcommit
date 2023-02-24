class DeliveryAddress < ApplicationRecord
    belongs_to :customer
    validates :post_code, length: { is: 7 }, numericality: { only_integer: true }
    validates :address, presence: true
    validates :addressee, presence: true
    
  def delivery_address_display
    '〒' + post_code + '' + delivery_address + '' + addressee
  end
  
end
