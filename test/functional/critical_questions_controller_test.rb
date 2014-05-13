require 'test_helper'

class CriticalQuestionsControllerTest < ActionController::TestCase
  setup do
    @critical_question = critical_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:critical_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create critical_question" do
    assert_difference('CriticalQuestion.count') do
      post :create, critical_question: { description: @critical_question.description, scheme_id: @critical_question.scheme_id }
    end

    assert_redirected_to critical_question_path(assigns(:critical_question))
  end

  test "should show critical_question" do
    get :show, id: @critical_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @critical_question
    assert_response :success
  end

  test "should update critical_question" do
    put :update, id: @critical_question, critical_question: { description: @critical_question.description, scheme_id: @critical_question.scheme_id }
    assert_redirected_to critical_question_path(assigns(:critical_question))
  end

  test "should destroy critical_question" do
    assert_difference('CriticalQuestion.count', -1) do
      delete :destroy, id: @critical_question
    end

    assert_redirected_to critical_questions_path
  end
end
