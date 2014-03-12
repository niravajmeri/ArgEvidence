require 'test_helper'

class InferenceRulesControllerTest < ActionController::TestCase
  setup do
    @inference_rule = inference_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inference_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inference_rule" do
    assert_difference('InferenceRule.count') do
      post :create, inference_rule: { description: @inference_rule.description }
    end

    assert_redirected_to inference_rule_path(assigns(:inference_rule))
  end

  test "should show inference_rule" do
    get :show, id: @inference_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inference_rule
    assert_response :success
  end

  test "should update inference_rule" do
    put :update, id: @inference_rule, inference_rule: { description: @inference_rule.description }
    assert_redirected_to inference_rule_path(assigns(:inference_rule))
  end

  test "should destroy inference_rule" do
    assert_difference('InferenceRule.count', -1) do
      delete :destroy, id: @inference_rule
    end

    assert_redirected_to inference_rules_path
  end
end
