require 'test_helper'

class SpaceChecksControllerTest < ActionController::TestCase
  setup do
    @space_check = space_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_check" do
    assert_difference('SpaceCheck.count') do
      post :create, space_check: { name: @space_check.name, passed: @space_check.passed, ticket_number: @space_check.ticket_number }
    end

    assert_redirected_to space_check_path(assigns(:space_check))
  end

  test "should show space_check" do
    get :show, id: @space_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_check
    assert_response :success
  end

  test "should update space_check" do
    put :update, id: @space_check, space_check: { name: @space_check.name, passed: @space_check.passed, ticket_number: @space_check.ticket_number }
    assert_redirected_to space_check_path(assigns(:space_check))
  end

  test "should destroy space_check" do
    assert_difference('SpaceCheck.count', -1) do
      delete :destroy, id: @space_check
    end

    assert_redirected_to space_checks_path
  end
end
