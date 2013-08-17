class SurveyResult < ActiveRecord::Base
	attr_accessible :total_E, :total_I, :total_S, :total_N, :total_T,
	 				:total_F, :total_J, :total_P, :survey_answers, :user_id, :survey_id
	belongs_to :user
	belongs_to :survey

	def personality_type
		key = ""
		key += (total_E > total_I) ? "E" : "I"
		key += (total_S > total_N) ? "S" : "N"
		key += (total_T > total_F) ? "T" : "F"
		key += (total_J > total_P) ? "J" : "P"
		PersonalityType.where({name: key}).first
	end
	
end
