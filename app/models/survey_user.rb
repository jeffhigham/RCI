class SurveyUser < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :company, :title, :email, :phone, :survey_results_attributes
	validates_presence_of :email
	validates_format_of :email, :with => /.+@.+\..+/i
	validates_presence_of :first_name
	has_many :survey_results
end
