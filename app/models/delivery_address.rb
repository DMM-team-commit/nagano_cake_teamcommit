class DeliveryAddress < ApplicationRecord
    belongs_to :customer
    validates :address, presence: true
    validates :addressee, presence: true
end
