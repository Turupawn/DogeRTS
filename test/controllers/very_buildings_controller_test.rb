require 'test_helper'

class VeryBuildingsControllerTest < ActionController::TestCase
  setup do
    @very_building = very_buildings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:very_buildings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create very_building" do
    assert_difference('VeryBuilding.count') do
      post :create, very_building: { hp: @very_building.hp, position: @very_building.position, such_type: @very_building.such_type, user_id: @very_building.user_id }
    end

    assert_redirected_to very_building_path(assigns(:very_building))
  end

  test "should show very_building" do
    get :show, id: @very_building
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @very_building
    assert_response :success
  end

  test "should update very_building" do
    patch :update, id: @very_building, very_building: { hp: @very_building.hp, position: @very_building.position, such_type: @very_building.such_type, user_id: @very_building.user_id }
    assert_redirected_to very_building_path(assigns(:very_building))
  end

  test "should destroy very_building" do
    assert_difference('VeryBuilding.count', -1) do
      delete :destroy, id: @very_building
    end

    assert_redirected_to very_buildings_path
  end
end
