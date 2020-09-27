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

  enum payment_method: { クレジットカード: 0, 銀行振込: 1}
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

  after_update do
    if self.status == "入金確認" #注文ステータスが製作中になったら
       self.order_items.each do |order_item|
        order_item.update(making_status: 1) #製作ステータスを製作待ちにする
      end
    end
  end
end

