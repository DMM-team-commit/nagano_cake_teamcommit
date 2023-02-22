class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details,  dependent: :destroy
    has_one_attached :image
    
    enum payment_method: { credit_card:0, transfer:1 }
    enum status_method: { waiting:0, confirmation:1, making:2, ready:3, sent:4 } 
end
