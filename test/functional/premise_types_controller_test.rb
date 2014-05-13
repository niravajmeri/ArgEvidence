require 'test_helper'

class PremiseTypesControllerTest < ActionController::TestCase
  setup do
    @premise_type = premise_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premise_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premise_type" do
    assert_difference('PremiseType.count') do
      post :create, premise_type: { name: @premise_type.name }
    end

    assert_redirected_to premise_type_path(assigns(:premise_type))
  end

  test "should show premise_type" do
    get :show, id: @premise_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premise_type
    assert_response :success
  end

  test "should update premise_type" do
    put :update, id: @premise_type, premise_type: { name: @premise_type.name }
    assert_redirected_to premise_type_path(assigns(:premise_type))
  end

  test "should destroy premise_type" do
    assert_difference('PremiseType.count', -1) do
      delete :destroy, id: @premise_type
    end

    assert_redirected_to premise_types_path
  end
end
