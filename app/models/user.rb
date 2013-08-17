class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :password, :password_confirmation, :survey_results_attributes
	validates_uniqueness_of :email
	has_many :survey_results
end
