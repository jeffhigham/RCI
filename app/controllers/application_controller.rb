class ApplicationController < ActionController::Base
  protect_from_forgery


  private

		def current_user
		  @current_user ||= User.find(session[:user_id]) if session[:user_id]
		end
		helper_method :current_user

		def authorize
		  redirect_to login_url, alert: "Not authorized" if current_user.nil?
		end

		def survey_user
		  @survey_user ||= SurveyUser.find(session[:survey_user_id]) if session[:survey_user_id]
		end
		helper_method :survey_user

		def authorize_survey_user
			redirect_to survey_user_login_url if survey_user.nil?
		end

end