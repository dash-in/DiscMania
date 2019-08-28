class ShippingInfo < ApplicationRecord
    belongs_to :user

     validates :name, presence: true
  	 validates :post_number, presence: true,  format: {with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/ }
  	 validates :address, presence: true

    def view_all_info
        self.name + ' ／　' + self.post_number.to_s + '　／　' + self.address.to_s
    end
end