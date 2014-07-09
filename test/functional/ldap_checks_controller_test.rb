require 'test_helper'

class LdapChecksControllerTest < ActionController::TestCase
  setup do
    @ldap_check = ldap_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_check" do
    assert_difference('LdapCheck.count') do
      post :create, ldap_check: { name: @ldap_check.name }
    end

    assert_redirected_to ldap_check_path(assigns(:ldap_check))
  end

  test "should show ldap_check" do
    get :show, id: @ldap_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ldap_check
    assert_response :success
  end

  test "should update ldap_check" do
    put :update, id: @ldap_check, ldap_check: { name: @ldap_check.name }
    assert_redirected_to ldap_check_path(assigns(:ldap_check))
  end

  test "should destroy ldap_check" do
    assert_difference('LdapCheck.count', -1) do
      delete :destroy, id: @ldap_check
    end

    assert_redirected_to ldap_checks_path
  end
end
