require 'test_helper'

class ReloudEntriesControllerTest < ActionController::TestCase
  setup do
    @reloud_entry = reloud_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reloud_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reloud_entry" do
    assert_difference('ReloudEntry.count') do
      post :create, reloud_entry: { name: @reloud_entry.name }
    end

    assert_redirected_to reloud_entry_path(assigns(:reloud_entry))
  end

  test "should show reloud_entry" do
    get :show, id: @reloud_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reloud_entry
    assert_response :success
  end

  test "should update reloud_entry" do
    put :update, id: @reloud_entry, reloud_entry: { name: @reloud_entry.name }
    assert_redirected_to reloud_entry_path(assigns(:reloud_entry))
  end

  test "should destroy reloud_entry" do
    assert_difference('ReloudEntry.count', -1) do
      delete :destroy, id: @reloud_entry
    end

    assert_redirected_to reloud_entries_path
  end
end
