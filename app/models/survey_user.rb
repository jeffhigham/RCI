class SurveyUser < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :company, :title, :email, :survey_results_attributes
	validates_uniqueness_of :email
	validates_presence_of :email
	validates_format_of :email, :with => /.+@.+\..+/i
	has_many :survey_results
end
