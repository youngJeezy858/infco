require 'test_helper'

class BackupChecksControllerTest < ActionController::TestCase
  setup do
    @backup_check = backup_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backup_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backup_check" do
    assert_difference('BackupCheck.count') do
      post :create, backup_check: { name: @backup_check.name, passed: @backup_check.passed, ticket_number: @backup_check.ticket_number }
    end

    assert_redirected_to backup_check_path(assigns(:backup_check))
  end

  test "should show backup_check" do
    get :show, id: @backup_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backup_check
    assert_response :success
  end

  test "should update backup_check" do
    put :update, id: @backup_check, backup_check: { name: @backup_check.name, passed: @backup_check.passed, ticket_number: @backup_check.ticket_number }
    assert_redirected_to backup_check_path(assigns(:backup_check))
  end

  test "should destroy backup_check" do
    assert_difference('BackupCheck.count', -1) do
      delete :destroy, id: @backup_check
    end

    assert_redirected_to backup_checks_path
  end
end
