json.extract! order, :id, :user_id, :shipping_info_id, :payment_method, :actual_shipping, :actual_tax, :total_price, :receipt_status, :shipping_status, :created_at, :updated_at
json.url order_url(order, format: :json)
