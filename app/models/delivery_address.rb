class DeliveryAddress < ApplicationRecord
    belongs_to :customer
    validates :post_code, length: { is: 7 }, numericality: { only_integer: true }
    validates :address, presence: true
    validates :addressee, presence: true
    
end
