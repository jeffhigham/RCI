class SurveyInstanceController < ApplicationController
  layout 'survey'
  before_filter :authorize_survey_user
  
  def new
  	# @survey_instance = Survey.first
   #  respond_to do |format|
   #    format.html # show.html.erb
   #    format.json { render json: @survey_instance.questions }
   #    format.xml { render xml: @survey_instance.questions }
   #  end
  end

  def create
    survey_id = 1
    survey_totals = {
    	survey_id: survey_id,
    	survey_user_id: survey_user.id,
    	total_E: 0,
    	total_I: 0,
    	total_S: 0,
    	total_N: 0,
    	total_T: 0,
    	total_F: 0,
    	total_J: 0,
    	total_P: 0
    }
    total_questions = Survey.find(survey_id).questions.count
    if (params['questions'].blank?)
      redirect_to take_survey_path, notice: "You didn't answer a SINGLE question!"
    elsif (params['questions'].count != total_questions)
      redirect_to take_survey_path, notice: "You answered #{params['questions'].count} of #{total_questions} total questions."
    else
      
      params['questions'].each do |answer|
        if survey_totals[:"total_#{answer[1]}"].nil?
          redirect_to take_survey_path, notice: "There was a problem with your survey, please try again."
        else
          survey_totals[:"total_#{answer[1]}"] += 1
        end
      end

      logger.info "Survey Totals: #{survey_totals.to_s}"
      survey_result = SurveyResult.new(survey_totals)
      if survey_result.save!
        survey_user.personality_type = survey_result.personality_type.name
        survey_user.save!
  	   redirect_to survey_user_survey_result_path(survey_user,survey_result), notice: "Your Survey Results!"
      else
       redirect_to survey_user_survey_results_path(survey_user), notice: "There was a problem with your survey!"
      end
    end

  end

end