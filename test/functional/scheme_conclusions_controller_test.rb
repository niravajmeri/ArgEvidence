require 'test_helper'

class SchemeConclusionsControllerTest < ActionController::TestCase
  setup do
    @scheme_conclusion = scheme_conclusions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scheme_conclusions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scheme_conclusion" do
    assert_difference('SchemeConclusion.count') do
      post :create, scheme_conclusion: { description: @scheme_conclusion.description, scheme_id: @scheme_conclusion.scheme_id }
    end

    assert_redirected_to scheme_conclusion_path(assigns(:scheme_conclusion))
  end

  test "should show scheme_conclusion" do
    get :show, id: @scheme_conclusion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scheme_conclusion
    assert_response :success
  end

  test "should update scheme_conclusion" do
    put :update, id: @scheme_conclusion, scheme_conclusion: { description: @scheme_conclusion.description, scheme_id: @scheme_conclusion.scheme_id }
    assert_redirected_to scheme_conclusion_path(assigns(:scheme_conclusion))
  end

  test "should destroy scheme_conclusion" do
    assert_difference('SchemeConclusion.count', -1) do
      delete :destroy, id: @scheme_conclusion
    end

    assert_redirected_to scheme_conclusions_path
  end
end
