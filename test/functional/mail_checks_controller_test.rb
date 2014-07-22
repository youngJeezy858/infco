require 'test_helper'

class MailChecksControllerTest < ActionController::TestCase
  setup do
    @mail_check = mail_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mail_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mail_check" do
    assert_difference('MailCheck.count') do
      post :create, mail_check: { passed: @mail_check.passed, ticket: @mail_check.ticket }
    end

    assert_redirected_to mail_check_path(assigns(:mail_check))
  end

  test "should show mail_check" do
    get :show, id: @mail_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mail_check
    assert_response :success
  end

  test "should update mail_check" do
    put :update, id: @mail_check, mail_check: { passed: @mail_check.passed, ticket: @mail_check.ticket }
    assert_redirected_to mail_check_path(assigns(:mail_check))
  end

  test "should destroy mail_check" do
    assert_difference('MailCheck.count', -1) do
      delete :destroy, id: @mail_check
    end

    assert_redirected_to mail_checks_path
  end
end
