class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  validates :receiver_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
