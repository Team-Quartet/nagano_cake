require 'test_helper'

class ShippingAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shipping_addresses_create_url
    assert_response :success
  end

end
