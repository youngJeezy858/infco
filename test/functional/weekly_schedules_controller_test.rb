require 'test_helper'

class WeeklySchedulesControllerTest < ActionController::TestCase
  setup do
    @weekly_schedule = weekly_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekly_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekly_schedule" do
    assert_difference('WeeklySchedule.count') do
      post :create, weekly_schedule: { friday: @weekly_schedule.friday, monday: @weekly_schedule.monday, name: @weekly_schedule.name, thursday: @weekly_schedule.thursday, tuesday: @weekly_schedule.tuesday, wednesday: @weekly_schedule.wednesday }
    end

    assert_redirected_to weekly_schedule_path(assigns(:weekly_schedule))
  end

  test "should show weekly_schedule" do
    get :show, id: @weekly_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekly_schedule
    assert_response :success
  end

  test "should update weekly_schedule" do
    put :update, id: @weekly_schedule, weekly_schedule: { friday: @weekly_schedule.friday, monday: @weekly_schedule.monday, name: @weekly_schedule.name, thursday: @weekly_schedule.thursday, tuesday: @weekly_schedule.tuesday, wednesday: @weekly_schedule.wednesday }
    assert_redirected_to weekly_schedule_path(assigns(:weekly_schedule))
  end

  test "should destroy weekly_schedule" do
    assert_difference('WeeklySchedule.count', -1) do
      delete :destroy, id: @weekly_schedule
    end

    assert_redirected_to weekly_schedules_path
  end
end
