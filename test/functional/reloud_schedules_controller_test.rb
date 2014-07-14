require 'test_helper'

class ReloudSchedulesControllerTest < ActionController::TestCase
  setup do
    @reloud_schedule = reloud_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reloud_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reloud_schedule" do
    assert_difference('ReloudSchedule.count') do
      post :create, reloud_schedule: { machine_name: @reloud_schedule.machine_name, person: @reloud_schedule.person }
    end

    assert_redirected_to reloud_schedule_path(assigns(:reloud_schedule))
  end

  test "should show reloud_schedule" do
    get :show, id: @reloud_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reloud_schedule
    assert_response :success
  end

  test "should update reloud_schedule" do
    put :update, id: @reloud_schedule, reloud_schedule: { machine_name: @reloud_schedule.machine_name, person: @reloud_schedule.person }
    assert_redirected_to reloud_schedule_path(assigns(:reloud_schedule))
  end

  test "should destroy reloud_schedule" do
    assert_difference('ReloudSchedule.count', -1) do
      delete :destroy, id: @reloud_schedule
    end

    assert_redirected_to reloud_schedules_path
  end
end
