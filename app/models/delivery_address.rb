class DeliveryAddress < ApplicationRecord
    belongs_to :customer
    validate :address, presence :true
    validate :addressee, presence :true
end
