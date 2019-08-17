require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Actual shipping", with: @order.actual_shipping
    fill_in "Actual tax", with: @order.actual_tax
    fill_in "Payment method", with: @order.payment_method
    fill_in "Receipt status", with: @order.receipt_status
    fill_in "Shipping info", with: @order.shipping_info_id
    fill_in "Shipping status", with: @order.shipping_status
    fill_in "Total price", with: @order.total_price
    fill_in "User", with: @order.user_id
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Actual shipping", with: @order.actual_shipping
    fill_in "Actual tax", with: @order.actual_tax
    fill_in "Payment method", with: @order.payment_method
    fill_in "Receipt status", with: @order.receipt_status
    fill_in "Shipping info", with: @order.shipping_info_id
    fill_in "Shipping status", with: @order.shipping_status
    fill_in "Total price", with: @order.total_price
    fill_in "User", with: @order.user_id
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
