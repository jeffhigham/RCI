class PersonalityType < ActiveRecord::Base
	attr_accessible :name, :title, :message
	belongs_to :survey
end
