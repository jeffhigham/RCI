class SurveyUsersController < ApplicationController
	before_filter :authorize, :except => [:new, :create]
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
		@survey_user = SurveyUser.find(params[:id])

	end

	def index
		respond_to do |format|
	    format.html {
	    	@survey_users = SurveyUser.all.page(params[:page])
	    }
	    format.csv {
	    	 @survey_users = SurveyUser.all
	    	send_data @survey_users.to_csv
	    }
	    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  	end
	end

end
