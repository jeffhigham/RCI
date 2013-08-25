open("/Users/jeffh/Desktop/account_import.csv") do |csv_questions|
	csv_questions.read.each_line do |csv_question|
		(	i_recid,username,password,email,igroups,i_form_owner,
		last_login,newsletter,wherefrom,first_name,personality_type,
		date_taken ) = csv_question.chomp.split(",")
	
		first_name,last_name = first_name.split.map(&:capitalize).join(' ').split(' ')
		if !date_taken.nil? and date_taken.length == 13
			date,time = date_taken.split(" ")
			month,day,year = date.split("/")
			if year.to_i < 2000
				year = year.to_i + 2000
			end
			created_at = Time.new(year,month,day)
		else
			created_at = nil
		end
		
		puts "#{first_name} #{last_name} #{email} #{personality_type} #{created_at}"

		survey_user = SurveyUser.create([
  			{ 
  				:id => i_recid,
  				:first_name => first_name,
  				:last_name => last_name,
  				:company => nil,
  				:title => nil, 
  				:email => email,
  				:phone => "",
  				:personality_type => personality_type,
  				:imported => true,
  				:created_at => created_at
  			}
			], :without_protection => true )
	end
end

