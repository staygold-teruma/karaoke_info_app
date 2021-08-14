require "test_helper"

class FeeInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fee_info_index_url
    assert_response :success
  end

  test "should get new" do
    get fee_info_new_url
    assert_response :success
  end

  test "should get crreate" do
    get fee_info_crreate_url
    assert_response :success
  end

  test "should get show" do
    get fee_info_show_url
    assert_response :success
  end

  test "should get edit" do
    get fee_info_edit_url
    assert_response :success
  end

  test "should get update" do
    get fee_info_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fee_info_destroy_url
    assert_response :success
  end
end
