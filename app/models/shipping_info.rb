class ShippingInfo < ApplicationRecord
    belongs_to :user

    def view_all_info
        self.name + ' ／　' + self.post_number.to_s + '　／　' + self.address.to_s
    end
end
