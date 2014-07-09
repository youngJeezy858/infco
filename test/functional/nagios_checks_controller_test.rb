require 'test_helper'

class NagiosChecksControllerTest < ActionController::TestCase
  setup do
    @nagios_check = nagios_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nagios_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nagios_check" do
    assert_difference('NagiosCheck.count') do
      post :create, nagios_check: { name: @nagios_check.name }
    end

    assert_redirected_to nagios_check_path(assigns(:nagios_check))
  end

  test "should show nagios_check" do
    get :show, id: @nagios_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nagios_check
    assert_response :success
  end

  test "should update nagios_check" do
    put :update, id: @nagios_check, nagios_check: { name: @nagios_check.name }
    assert_redirected_to nagios_check_path(assigns(:nagios_check))
  end

  test "should destroy nagios_check" do
    assert_difference('NagiosCheck.count', -1) do
      delete :destroy, id: @nagios_check
    end

    assert_redirected_to nagios_checks_path
  end
end
