require 'test_helper'

class PrinterChecksControllerTest < ActionController::TestCase
  setup do
    @printer_check = printer_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:printer_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create printer_check" do
    assert_difference('PrinterCheck.count') do
      post :create, printer_check: { name: @printer_check.name }
    end

    assert_redirected_to printer_check_path(assigns(:printer_check))
  end

  test "should show printer_check" do
    get :show, id: @printer_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @printer_check
    assert_response :success
  end

  test "should update printer_check" do
    put :update, id: @printer_check, printer_check: { name: @printer_check.name }
    assert_redirected_to printer_check_path(assigns(:printer_check))
  end

  test "should destroy printer_check" do
    assert_difference('PrinterCheck.count', -1) do
      delete :destroy, id: @printer_check
    end

    assert_redirected_to printer_checks_path
  end
end
