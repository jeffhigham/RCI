class SurveyUser < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :company, :title, :email, :phone, :survey_results_attributes
	validates_presence_of :email
	validates_format_of :email, :with => /.+@.+\..+/i
	validates_presence_of :first_name
	has_many :survey_results

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |survey_user|
	      csv << survey_user.attributes.values_at(*column_names)
	    end
	  end
	end

end