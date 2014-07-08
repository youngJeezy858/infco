require 'test_helper'

class NagiosEntriesControllerTest < ActionController::TestCase
  setup do
    @nagios_entry = nagios_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nagios_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nagios_entry" do
    assert_difference('NagiosEntry.count') do
      post :create, nagios_entry: { name: @nagios_entry.name }
    end

    assert_redirected_to nagios_entry_path(assigns(:nagios_entry))
  end

  test "should show nagios_entry" do
    get :show, id: @nagios_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nagios_entry
    assert_response :success
  end

  test "should update nagios_entry" do
    put :update, id: @nagios_entry, nagios_entry: { name: @nagios_entry.name }
    assert_redirected_to nagios_entry_path(assigns(:nagios_entry))
  end

  test "should destroy nagios_entry" do
    assert_difference('NagiosEntry.count', -1) do
      delete :destroy, id: @nagios_entry
    end

    assert_redirected_to nagios_entries_path
  end
end
