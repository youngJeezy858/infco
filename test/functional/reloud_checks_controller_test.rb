require 'test_helper'

class ReloudChecksControllerTest < ActionController::TestCase
  setup do
    @reloud_check = reloud_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reloud_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reloud_check" do
    assert_difference('ReloudCheck.count') do
      post :create, reloud_check: { date: @reloud_check.date, name: @reloud_check.name, owner: @reloud_check.owner }
    end

    assert_redirected_to reloud_check_path(assigns(:reloud_check))
  end

  test "should show reloud_check" do
    get :show, id: @reloud_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reloud_check
    assert_response :success
  end

  test "should update reloud_check" do
    put :update, id: @reloud_check, reloud_check: { date: @reloud_check.date, name: @reloud_check.name, owner: @reloud_check.owner }
    assert_redirected_to reloud_check_path(assigns(:reloud_check))
  end

  test "should destroy reloud_check" do
    assert_difference('ReloudCheck.count', -1) do
      delete :destroy, id: @reloud_check
    end

    assert_redirected_to reloud_checks_path
  end
end
