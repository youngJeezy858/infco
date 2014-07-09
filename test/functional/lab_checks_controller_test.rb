require 'test_helper'

class LabChecksControllerTest < ActionController::TestCase
  setup do
    @lab_check = lab_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lab_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lab_check" do
    assert_difference('LabCheck.count') do
      post :create, lab_check: { completed: @lab_check.completed, lab_name: @lab_check.lab_name, machine1_name: @lab_check.machine1_name, machine2_name: @lab_check.machine2_name, machine3_name: @lab_check.machine3_name }
    end

    assert_redirected_to lab_check_path(assigns(:lab_check))
  end

  test "should show lab_check" do
    get :show, id: @lab_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lab_check
    assert_response :success
  end

  test "should update lab_check" do
    put :update, id: @lab_check, lab_check: { completed: @lab_check.completed, lab_name: @lab_check.lab_name, machine1_name: @lab_check.machine1_name, machine2_name: @lab_check.machine2_name, machine3_name: @lab_check.machine3_name }
    assert_redirected_to lab_check_path(assigns(:lab_check))
  end

  test "should destroy lab_check" do
    assert_difference('LabCheck.count', -1) do
      delete :destroy, id: @lab_check
    end

    assert_redirected_to lab_checks_path
  end
end
