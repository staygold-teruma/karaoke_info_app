require "test_helper"

class MainPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_plans_index_url
    assert_response :success
  end

  test "should get new" do
    get main_plans_new_url
    assert_response :success
  end

  test "should get create" do
    get main_plans_create_url
    assert_response :success
  end

  test "should get show" do
    get main_plans_show_url
    assert_response :success
  end

  test "should get edit" do
    get main_plans_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get main_plans_destroy_url
    assert_response :success
  end
end
