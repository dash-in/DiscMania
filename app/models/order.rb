class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

   enum shipping_status: { undelivery: 0, delivery: 1, delivered: 2 }
end
