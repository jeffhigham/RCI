EI = %w(1 8 15 22 29 36 43 50 57 64)
SN = %w(2 3 9 10 16 17 23 24 30 31 37 38 44 45 51 52 58 59 65 66)
TF = %w(4 5 11 12 18 19 25 26 32 33 39 40 46 47 53 54 60 61 67 68)
JP = %w( 6 7 13 14 20 21 27 28 34 35 41 42 48 49 55 56 62 63 69 70)
aCat = nil
bCat = nil

survey = Survey.create! name: "The Relative Captivity Indicator"

open("/Users/jeffh/Sites/rails/RCI/questions.csv") do |csv_questions|
csv_questions.read.each_line do |csv_question|
	q,a,b = csv_question.chomp.split(",")
	puts "Adding question: #{q}"
	question = survey.questions.create!({content: q })
	if EI.include? question.id.to_s
		aCat = "E"
		bCat = "I"
	elsif SN.include? question.id.to_s
		aCat = "S"
		bCat = "N"
	elsif TF.include? question.id.to_s
		aCat = "T"
		bCat = "F"
	elsif JP.include? question.id.to_s
		aCat = "J"
		bCat = "P"
	end
	puts "	Adding anser: #{a} Category: #{aCat}"
		question.answers.create! ({content: a, category: aCat})
	puts "	Adding anser: #{b} Category: #{bCat}\n\n"
		question.answers.create! ({content: b, category: bCat})
	end
end

