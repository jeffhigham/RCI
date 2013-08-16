class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :surveys_attributes
  has_many :questions
  has_many :personality_types
  accepts_nested_attributes_for :questions, allow_destroy: true
end
