class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :items, through: :cart_items
  has_many :orders
  has_many :shipping_addresses

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

#姓、名をまとめた命名
  def full_name
     self.family_name + self.first_name
  end

  def self.search(search)
      if search
        Customer.where(['family_name LIKE ?', "%#{search}%"])
      else
        Customer.all
      end
    end
end