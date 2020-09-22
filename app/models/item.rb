class Item < ApplicationRecord

	belongs_to :genre
	has_many :order_items
	has_many :orders, through: :order_items
	has_many :cart_items
	has_many :customers, through: :cart_items

	attachment :image, destroy: false

	validates :name, presence: true
  validates :introduction, presence: true
  validates :non_taxed_price, presence: true

  def self.search(search)
      if search
        Item.where(['name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end
end
