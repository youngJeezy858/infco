require 'test_helper'

class BackupEntriesControllerTest < ActionController::TestCase
  setup do
    @backup_entry = backup_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backup_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backup_entry" do
    assert_difference('BackupEntry.count') do
      post :create, backup_entry: { name: @backup_entry.name }
    end

    assert_redirected_to backup_entry_path(assigns(:backup_entry))
  end

  test "should show backup_entry" do
    get :show, id: @backup_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backup_entry
    assert_response :success
  end

  test "should update backup_entry" do
    put :update, id: @backup_entry, backup_entry: { name: @backup_entry.name }
    assert_redirected_to backup_entry_path(assigns(:backup_entry))
  end

  test "should destroy backup_entry" do
    assert_difference('BackupEntry.count', -1) do
      delete :destroy, id: @backup_entry
    end

    assert_redirected_to backup_entries_path
  end
end
