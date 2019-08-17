require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { actual_shipping: @order.actual_shipping, actual_tax: @order.actual_tax, payment_method: @order.payment_method, receipt_status: @order.receipt_status, shipping_info_id: @order.shipping_info_id, shipping_status: @order.shipping_status, total_price: @order.total_price, user_id: @order.user_id } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { actual_shipping: @order.actual_shipping, actual_tax: @order.actual_tax, payment_method: @order.payment_method, receipt_status: @order.receipt_status, shipping_info_id: @order.shipping_info_id, shipping_status: @order.shipping_status, total_price: @order.total_price, user_id: @order.user_id } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
