require 'test_helper'

class InternalChecksControllerTest < ActionController::TestCase
  setup do
    @internal_check = internal_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internal_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internal_check" do
    assert_difference('InternalCheck.count') do
      post :create, internal_check: { date: @internal_check.date, owner: @internal_check.owner, passed: @internal_check.passed }
    end

    assert_redirected_to internal_check_path(assigns(:internal_check))
  end

  test "should show internal_check" do
    get :show, id: @internal_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internal_check
    assert_response :success
  end

  test "should update internal_check" do
    put :update, id: @internal_check, internal_check: { date: @internal_check.date, owner: @internal_check.owner, passed: @internal_check.passed }
    assert_redirected_to internal_check_path(assigns(:internal_check))
  end

  test "should destroy internal_check" do
    assert_difference('InternalCheck.count', -1) do
      delete :destroy, id: @internal_check
    end

    assert_redirected_to internal_checks_path
  end
end
