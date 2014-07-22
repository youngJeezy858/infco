require 'test_helper'

class VirtualBoxChecksControllerTest < ActionController::TestCase
  setup do
    @virtual_box_check = virtual_box_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virtual_box_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virtual_box_check" do
    assert_difference('VirtualBoxCheck.count') do
      post :create, virtual_box_check: { date: @virtual_box_check.date, name: @virtual_box_check.name, ticket: @virtual_box_check.ticket }
    end

    assert_redirected_to virtual_box_check_path(assigns(:virtual_box_check))
  end

  test "should show virtual_box_check" do
    get :show, id: @virtual_box_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @virtual_box_check
    assert_response :success
  end

  test "should update virtual_box_check" do
    put :update, id: @virtual_box_check, virtual_box_check: { date: @virtual_box_check.date, name: @virtual_box_check.name, ticket: @virtual_box_check.ticket }
    assert_redirected_to virtual_box_check_path(assigns(:virtual_box_check))
  end

  test "should destroy virtual_box_check" do
    assert_difference('VirtualBoxCheck.count', -1) do
      delete :destroy, id: @virtual_box_check
    end

    assert_redirected_to virtual_box_checks_path
  end
end
