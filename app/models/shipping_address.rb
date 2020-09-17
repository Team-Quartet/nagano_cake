class ShippingAddress < ApplicationRecord
	
	# 郵便番号 ７桁固定
	validates :postal_code,  presence: true, format: {with: /\A\d{7}\z/}
	validates :address, presence: true
	validates :receiver_name, presence: true
   
	belongs_to :customer
end
