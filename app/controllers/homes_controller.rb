class HomesController < ApplicationController

	def index
		@personalty_types = PersonalityType.all
	end
	
end
