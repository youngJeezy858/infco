require 'test_helper'

class OperationsChecksControllerTest < ActionController::TestCase
  setup do
    @operations_check = operations_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operations_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operations_check" do
    assert_difference('OperationsCheck.count') do
      post :create, operations_check: { date: @operations_check.date, string: @operations_check.string }
    end

    assert_redirected_to operations_check_path(assigns(:operations_check))
  end

  test "should show operations_check" do
    get :show, id: @operations_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operations_check
    assert_response :success
  end

  test "should update operations_check" do
    put :update, id: @operations_check, operations_check: { date: @operations_check.date, string: @operations_check.string }
    assert_redirected_to operations_check_path(assigns(:operations_check))
  end

  test "should destroy operations_check" do
    assert_difference('OperationsCheck.count', -1) do
      delete :destroy, id: @operations_check
    end

    assert_redirected_to operations_checks_path
  end
end
