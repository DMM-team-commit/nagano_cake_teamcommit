class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true, length: { maximum: 20 }
  
  has_many :delivery_addresses,dependent: :destroy
  has_many :orders
  has_many :cart_items, dependent: :destroy

end

