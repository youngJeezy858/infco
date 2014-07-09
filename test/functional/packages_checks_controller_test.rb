require 'test_helper'

class PackagesChecksControllerTest < ActionController::TestCase
  setup do
    @packages_check = packages_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:packages_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create packages_check" do
    assert_difference('PackagesCheck.count') do
      post :create, packages_check: { name: @packages_check.name }
    end

    assert_redirected_to packages_check_path(assigns(:packages_check))
  end

  test "should show packages_check" do
    get :show, id: @packages_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @packages_check
    assert_response :success
  end

  test "should update packages_check" do
    put :update, id: @packages_check, packages_check: { name: @packages_check.name }
    assert_redirected_to packages_check_path(assigns(:packages_check))
  end

  test "should destroy packages_check" do
    assert_difference('PackagesCheck.count', -1) do
      delete :destroy, id: @packages_check
    end

    assert_redirected_to packages_checks_path
  end
end
