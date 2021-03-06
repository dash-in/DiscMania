class Order < ApplicationRecord
  belongs_to :user

  has_many :order_details, :dependent => :delete_all

  acts_as_paranoid


  validates :payment_method, presence: true
  validates :actual_shipping, presence: true
  validates :actual_tax, presence: true
  validates :total_price, presence: true
  validates :shipping_name, presence: true
  validates :shipping_post_num, presence: true
  validates :shipping_address, presence: true

   enum shipping_status: { undelivery: 0, delivery: 1, delivered: 2 }
   enum receipt_status: { undeposit: 0, deposit:1 }

end
