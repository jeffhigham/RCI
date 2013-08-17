require 'test_helper'

class SurveyResultsControllerTest < ActionController::TestCase
  setup do
    @survey_result = survey_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_result" do
    assert_difference('SurveyResult.count') do
      post :create, survey_result: { survey_answers: @survey_result.survey_answers, survey_id: @survey_result.survey_id, total_E: @survey_result.total_E, total_F: @survey_result.total_F, total_I: @survey_result.total_I, total_J: @survey_result.total_J, total_N: @survey_result.total_N, total_P: @survey_result.total_P, total_S: @survey_result.total_S, total_T: @survey_result.total_T, user_id: @survey_result.user_id }
    end

    assert_redirected_to survey_result_path(assigns(:survey_result))
  end

  test "should show survey_result" do
    get :show, id: @survey_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @survey_result
    assert_response :success
  end

  test "should update survey_result" do
    patch :update, id: @survey_result, survey_result: { survey_answers: @survey_result.survey_answers, survey_id: @survey_result.survey_id, total_E: @survey_result.total_E, total_F: @survey_result.total_F, total_I: @survey_result.total_I, total_J: @survey_result.total_J, total_N: @survey_result.total_N, total_P: @survey_result.total_P, total_S: @survey_result.total_S, total_T: @survey_result.total_T, user_id: @survey_result.user_id }
    assert_redirected_to survey_result_path(assigns(:survey_result))
  end

  test "should destroy survey_result" do
    assert_difference('SurveyResult.count', -1) do
      delete :destroy, id: @survey_result
    end

    assert_redirected_to survey_results_path
  end
end
