require 'test_helper'

class AutomountsControllerTest < ActionController::TestCase
  setup do
    @automount = automounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:automounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create automount" do
    assert_difference('Automount.count') do
      post :create, automount: { name: @automount.name }
    end

    assert_redirected_to automount_path(assigns(:automount))
  end

  test "should show automount" do
    get :show, id: @automount
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @automount
    assert_response :success
  end

  test "should update automount" do
    put :update, id: @automount, automount: { name: @automount.name }
    assert_redirected_to automount_path(assigns(:automount))
  end

  test "should destroy automount" do
    assert_difference('Automount.count', -1) do
      delete :destroy, id: @automount
    end

    assert_redirected_to automounts_path
  end
end
