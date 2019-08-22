class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :record

  # validates :order_id, presence: true
  # validates :record_id, presence: true
  # validates :order_id, presence: true
  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :price, presence: true
end
