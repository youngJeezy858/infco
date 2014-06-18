require 'test_helper'

class SpaceEntriesControllerTest < ActionController::TestCase
  setup do
    @space_entry = space_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_entry" do
    assert_difference('SpaceEntry.count') do
      post :create, space_entry: { name: @space_entry.name }
    end

    assert_redirected_to space_entry_path(assigns(:space_entry))
  end

  test "should show space_entry" do
    get :show, id: @space_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_entry
    assert_response :success
  end

  test "should update space_entry" do
    put :update, id: @space_entry, space_entry: { name: @space_entry.name }
    assert_redirected_to space_entry_path(assigns(:space_entry))
  end

  test "should destroy space_entry" do
    assert_difference('SpaceEntry.count', -1) do
      delete :destroy, id: @space_entry
    end

    assert_redirected_to space_entries_path
  end
end
