require 'test_helper'

class LoadBalancerChecksControllerTest < ActionController::TestCase
  setup do
    @load_balancer_check = load_balancer_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:load_balancer_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create load_balancer_check" do
    assert_difference('LoadBalancerCheck.count') do
      post :create, load_balancer_check: { name: @load_balancer_check.name }
    end

    assert_redirected_to load_balancer_check_path(assigns(:load_balancer_check))
  end

  test "should show load_balancer_check" do
    get :show, id: @load_balancer_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @load_balancer_check
    assert_response :success
  end

  test "should update load_balancer_check" do
    put :update, id: @load_balancer_check, load_balancer_check: { name: @load_balancer_check.name }
    assert_redirected_to load_balancer_check_path(assigns(:load_balancer_check))
  end

  test "should destroy load_balancer_check" do
    assert_difference('LoadBalancerCheck.count', -1) do
      delete :destroy, id: @load_balancer_check
    end

    assert_redirected_to load_balancer_checks_path
  end
end
