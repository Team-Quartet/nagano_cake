class OrderItem < ApplicationRecord

	belongs_to :order
	belongs_to :item

	enum making_status: {着手不可: 0,製作待ち: 1, 製作中: 2, 製作完了: 3}

	after_update do
		order_items = self.order.order_items
		if order_items.any? {|order_item| order_item.making_status == "製作中"} == true #製作ステータスが1つでも製作中になったら
		    self.order.update(status: 2) # 注文ステータスを製作中に変更する
		elsif order_items.all? {|order_item| order_item.making_status == "製作完了"} == true #製作ステータスが全て製作完了だったら
		    self.order.update(status: 3) # 注文ステータスを発送準備中に変更する
		end
	end
end
