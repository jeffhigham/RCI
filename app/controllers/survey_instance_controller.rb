class SurveyInstanceController < ApplicationController
  
  def new
  	@survey_instance = Survey.first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey_instance.questions }
      format.xml { render xml: @survey_instance.questions }
    end
  end

  def create
    #render json: params['answers']
    survey_totals = {
    	survey_id: 1,
    	user_id: 1,
    	total_E: 0,
    	total_I: 0,
    	total_S: 0,
    	total_N: 0,
    	total_T: 0,
    	total_F: 0,
    	total_J: 0,
    	total_P: 0
    }
    params['questions'].each do |answer|
    	survey_totals[:"total_#{answer[1]}"] += 1
    end
    logger.info "Survey Totals: #{survey_totals.to_s}"
    survey_result = SurveyResult.new(survey_totals)
    #render json: survey_result
    survey_result.save!
	redirect_to user_survey_results_path(current_user), notice: "Successfully created survey."
  end

end