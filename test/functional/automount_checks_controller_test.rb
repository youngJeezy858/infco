require 'test_helper'

class AutomountChecksControllerTest < ActionController::TestCase
  setup do
    @automount_check = automount_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:automount_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create automount_check" do
    assert_difference('AutomountCheck.count') do
      post :create, automount_check: { name: @automount_check.name }
    end

    assert_redirected_to automount_check_path(assigns(:automount_check))
  end

  test "should show automount_check" do
    get :show, id: @automount_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @automount_check
    assert_response :success
  end

  test "should update automount_check" do
    put :update, id: @automount_check, automount_check: { name: @automount_check.name }
    assert_redirected_to automount_check_path(assigns(:automount_check))
  end

  test "should destroy automount_check" do
    assert_difference('AutomountCheck.count', -1) do
      delete :destroy, id: @automount_check
    end

    assert_redirected_to automount_checks_path
  end
end
