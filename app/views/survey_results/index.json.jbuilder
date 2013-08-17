json.array!(@survey_results) do |survey_result|
  json.extract! survey_result, :survey_id, :user_id, :total_E, :total_I, :total_S, :total_N, :total_T, :total_F, :total_J, :total_P, :survey_answers
  json.url survey_result_url(survey_result, format: :json)
end
