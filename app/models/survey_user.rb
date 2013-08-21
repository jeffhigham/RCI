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

	def self.search(search)
	  if search
	    where( 'email LIKE ? or first_name LIKE ? or last_name LIKE ? or personality_type like ? or id like  ? or gender like ?', 
	    	"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%" )
	  else
	    scoped
	  end
	end

	def account_created
		Time.parse(created_at.to_s).strftime("%m/%d/%Y")
	end

end