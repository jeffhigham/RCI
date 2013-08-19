class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :surveys_attributes
  has_many :questions
  has_many :personality_types
  accepts_nested_attributes_for :questions, allow_destroy: true

  def get_question(question_number)
  	  		
		survey = Array.new
	  question = self.questions.find(question_number)
		survey << Hash.new
		survey[0][:question] =  question.content
		survey[0][:answers] = Array.new
		question.answers.each do |answer|
			survey[0][:answers] << {
					content: answer.content,
					category: answer.category
				}
		end
		survey
  end

  def all_questions
  	  		
  	survey = Array.new

  	  self.questions.each_with_index do |question,index|
  		survey[index] = Hash.new
  		survey[index][:question] =  question.content
  		survey[index][:answers] = Array.new
  		question.answers.each do |answer|
  			survey[index][:answers] << {
  					content: answer.content,
  					category: answer.category
  				}
  		end
  	end
  	survey
  end

end
