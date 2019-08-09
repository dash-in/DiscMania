class Setting < ApplicationRecord

    validates :shop_address, presence: true
    validates :shop_tel, presence: true
    validates :shipping, presence: true
    validates :tax, presence: true

end
