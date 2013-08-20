class SurveyUsersController < ApplicationController
	layout 'survey'
	def new
	  @survey_user = SurveyUser.new
	end

	def create
	  @survey_user = SurveyUser.new(params[:survey_user])
	  if @survey_user.save
	    session[:survey_user_id] = @survey_user.id
	    redirect_to take_survey_url
	  else
	    render "new"
	  end
	end

	def show 
	end

	def index
	end

end
