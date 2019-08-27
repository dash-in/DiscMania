class ShippingInfo < ApplicationRecord
    belongs_to :user

     validates :name, presence: true
  	 validates :post_number, presence: true
  	 validates :address, presence: true

    def view_all_info
        self.name + ' ／　' + self.post_number.to_s + '　／　' + self.address.to_s
    end
end