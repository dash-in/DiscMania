class Order < ApplicationRecord
    has_many :order_details
    belongs_to :user

    validates :payment_method, presence: true
    validates :actual_shipping, presence: true
    validates :actual_tax, presence: true
    validates :total_price, presence: true
    validates :shipping_name, presence: true
    validates :shipping_post_num, presence: true
    validates :shipping_address, presence: true
end
