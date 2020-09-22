require 'test_helper'

class Addmins::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get addmins_search_search_url
    assert_response :success
  end

end
