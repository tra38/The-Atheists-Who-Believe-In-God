require 'smarter_csv'
require_relative 'names.rb'
require_relative 'evaluate_data'
require_relative 'speech_template'

#Default seed is used to generate the same data with each individual "run".
#Change the seed if you want a new 'novel'.
srand 42

data = SmarterCSV.process('data/atheist_data.csv')

#A "struct" is a shorthand for creating a simple 'class' in Ruby, and is recommended 
#by Sandi Metz to "separate structure from meaning".
#More Info: http://stephaniehoh.github.io/blog/2013/12/28/the-ruby-struct-class/)

#This method takes an individual Hash argument and convert it into a format
#that the Character 'struct' will be able to accept.
def generate_character(args)
	character_profile = Hash.new
	character_profile[:name] = determine_name(args[:"sex"])
	character_profile[:age] = determine_age(args[:age], args[:race])
	character_profile[:personal_pronoun] = determine_pronoun(args[:"sex"])
	character_profile[:possessive_pronoun] = determine_possessive_pronoun(args[:"sex"])
	character_profile[:fake_faith] = [:simulationism,:pantheism,:karma,:alien].sample
	character_profile[:race] = determine_race(args[:race])
	character_profile[:education] = determine_education(args[:educ])
	character_profile[:wealth] = determine_wealth(args[:income])
	character_profile[:hispanic] = evaluate_hispanic_data(args[:HISP])
	character_profile[:moral_reasoning] = determine_moral_reasoning(args[:"q10d"])
	character_profile[:nature_of_god] = determine_nature_of_god(args[:"q32"])
	character_profile[:life_after_death] = determine_afterlife(heaven: args[:"q35"], hell: args[:"q36"], life_after_death: args[:"q33"])
	character_profile[:view_of_bible] = determine_view_of_bible(word_of_god: args[:"q37"], literalism: args[:"q38"])
	character_profile[:miracles] = evaluate_q39_data(args[:"q39a"])
	character_profile[:angels_and_demons] = evaluate_q39_data(args[:"q39b"])
	character_profile[:religion_causes_problems] = evaluate_q39_data(args[:"q39c"])
	character_profile[:prayer] = evaluate_prayer(args[:"q41"])
	character_profile[:mediation] = evaluate_q42_data(args[:"q42c"])
	character_profile[:preaching_atheism] = evaluate_q42_data(args[:"q42g"])
	character_profile[:divine_healing] = evaluate_divine_healing(args[:"q43d"])
	character_profile[:religion_in_politics] = evaluate_religion_in_politics(args[:"q9"])
	character_profile[:morality_in_politics] = evaluate_morality_in_politics(args[:"q5a"])
	character_profile[:clear_ethical_standards] = evaluate_q39_data(args[:"q10b"])
	character_profile[:evolution] = evaluate_q39_data(args[:"q10c"])
	character_profile
end

date = Date.new(2007,06,01) 

File.open("atheists.md", 'w') do |f|
	data.each do |row|
		speech = Speech.new(generate_character(row))
		f << "###"+date.strftime('%a %b %d %Y')+"\n\n"
		f << speech.text
		date += 1
	end
end

# hash = generate_character(data[0])
# puts hash

# puts data[2]
# hash = generate_character(data[2])

# speech = Speech.new(hash)
# puts speech.text