class Report < ActiveRecord::Base

	def indicator_totals	
		SurveyUser.all.count({:group => "personality_type", :order => "count_all DESC"}).to_hash
	end

end
