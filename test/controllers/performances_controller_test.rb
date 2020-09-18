require 'test_helper'

class PerformancesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get performances_new_url
    assert_response :success
  end

  test "should get edit" do
    get performances_edit_url
    assert_response :success
  end

  test "should get show" do
    get performances_show_url
    assert_response :success
  end

end
