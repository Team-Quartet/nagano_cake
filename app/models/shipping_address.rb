class ShippingAddress < ApplicationRecord
	
	# 郵便番号 ７桁固定
	validates :postal_code,  presence: true
	validates :address, presence: true
	validates :receiver_name, presence: true
   
	belongs_to :customer

	def address_detail
 		"#{self.postal_code}#{self.address}#{self.receiver_name}"
	end
end
