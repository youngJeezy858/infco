require 'test_helper'

class RtChecksControllerTest < ActionController::TestCase
  setup do
    @rt_check = rt_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rt_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rt_check" do
    assert_difference('RtCheck.count') do
      post :create, rt_check: { name: @rt_check.name }
    end

    assert_redirected_to rt_check_path(assigns(:rt_check))
  end

  test "should show rt_check" do
    get :show, id: @rt_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rt_check
    assert_response :success
  end

  test "should update rt_check" do
    put :update, id: @rt_check, rt_check: { name: @rt_check.name }
    assert_redirected_to rt_check_path(assigns(:rt_check))
  end

  test "should destroy rt_check" do
    assert_difference('RtCheck.count', -1) do
      delete :destroy, id: @rt_check
    end

    assert_redirected_to rt_checks_path
  end
end
