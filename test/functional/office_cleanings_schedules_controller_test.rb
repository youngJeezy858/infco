require 'test_helper'

class OfficeCleaningsSchedulesControllerTest < ActionController::TestCase
  setup do
    @office_cleanings_schedule = office_cleanings_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:office_cleanings_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office_cleanings_schedule" do
    assert_difference('OfficeCleaningsSchedule.count') do
      post :create, office_cleanings_schedule: { end_date: @office_cleanings_schedule.end_date, person: @office_cleanings_schedule.person, start_date: @office_cleanings_schedule.start_date }
    end

    assert_redirected_to office_cleanings_schedule_path(assigns(:office_cleanings_schedule))
  end

  test "should show office_cleanings_schedule" do
    get :show, id: @office_cleanings_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office_cleanings_schedule
    assert_response :success
  end

  test "should update office_cleanings_schedule" do
    put :update, id: @office_cleanings_schedule, office_cleanings_schedule: { end_date: @office_cleanings_schedule.end_date, person: @office_cleanings_schedule.person, start_date: @office_cleanings_schedule.start_date }
    assert_redirected_to office_cleanings_schedule_path(assigns(:office_cleanings_schedule))
  end

  test "should destroy office_cleanings_schedule" do
    assert_difference('OfficeCleaningsSchedule.count', -1) do
      delete :destroy, id: @office_cleanings_schedule
    end

    assert_redirected_to office_cleanings_schedules_path
  end
end
