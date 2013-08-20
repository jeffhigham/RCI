class ApiController < ApplicationController

	before_filter :authorize_survey_user

	def all_questions
    	questions = Survey.first.all_questions
	    respond_to do |format|
	      format.json { render json: questions }
	      format.xml { render xml: questions }
	  	end
	end

	def find
		question_number = params[:id]
		questions = Survey.first.get_question(question_number)
		respond_to do |format|
	      format.json { render json: questions }
	      format.xml { render xml: questions }
	  	end
	end

end
