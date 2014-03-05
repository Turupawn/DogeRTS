require 'test_helper'

class MuchWithdrawsControllerTest < ActionController::TestCase
  setup do
    @much_withdraw = much_withdraws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:much_withdraws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create much_withdraw" do
    assert_difference('MuchWithdraw.count') do
      post :create, much_withdraw: { amount: @much_withdraw.amount, building_id: @much_withdraw.building_id, such_date: @much_withdraw.such_date }
    end

    assert_redirected_to much_withdraw_path(assigns(:much_withdraw))
  end

  test "should show much_withdraw" do
    get :show, id: @much_withdraw
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @much_withdraw
    assert_response :success
  end

  test "should update much_withdraw" do
    patch :update, id: @much_withdraw, much_withdraw: { amount: @much_withdraw.amount, building_id: @much_withdraw.building_id, such_date: @much_withdraw.such_date }
    assert_redirected_to much_withdraw_path(assigns(:much_withdraw))
  end

  test "should destroy much_withdraw" do
    assert_difference('MuchWithdraw.count', -1) do
      delete :destroy, id: @much_withdraw
    end

    assert_redirected_to much_withdraws_path
  end
end
