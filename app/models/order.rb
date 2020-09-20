class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items
  has_many :items, through: :order_items

  validates :receiver_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

#郵便番号＋住所＋配送先氏名をまとめた命名
  def order_info
     self.postal_code + self.address + self.receiver_name
  end

end
