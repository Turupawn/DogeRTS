require 'test_helper'

class VeryLootsControllerTest < ActionController::TestCase
  setup do
    @very_loot = very_loots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:very_loots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create very_loot" do
    assert_difference('VeryLoot.count') do
      post :create, very_loot: { amount: @very_loot.amount, such_date: @very_loot.such_date, user_id: @very_loot.user_id }
    end

    assert_redirected_to very_loot_path(assigns(:very_loot))
  end

  test "should show very_loot" do
    get :show, id: @very_loot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @very_loot
    assert_response :success
  end

  test "should update very_loot" do
    patch :update, id: @very_loot, very_loot: { amount: @very_loot.amount, such_date: @very_loot.such_date, user_id: @very_loot.user_id }
    assert_redirected_to very_loot_path(assigns(:very_loot))
  end

  test "should destroy very_loot" do
    assert_difference('VeryLoot.count', -1) do
      delete :destroy, id: @very_loot
    end

    assert_redirected_to very_loots_path
  end
end
