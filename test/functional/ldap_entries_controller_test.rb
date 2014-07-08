require 'test_helper'

class LdapEntriesControllerTest < ActionController::TestCase
  setup do
    @ldap_entry = ldap_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_entry" do
    assert_difference('LdapEntry.count') do
      post :create, ldap_entry: { name: @ldap_entry.name }
    end

    assert_redirected_to ldap_entry_path(assigns(:ldap_entry))
  end

  test "should show ldap_entry" do
    get :show, id: @ldap_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ldap_entry
    assert_response :success
  end

  test "should update ldap_entry" do
    put :update, id: @ldap_entry, ldap_entry: { name: @ldap_entry.name }
    assert_redirected_to ldap_entry_path(assigns(:ldap_entry))
  end

  test "should destroy ldap_entry" do
    assert_difference('LdapEntry.count', -1) do
      delete :destroy, id: @ldap_entry
    end

    assert_redirected_to ldap_entries_path
  end
end
