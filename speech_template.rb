class Speech
	attr_reader :args, :text
	def initialize(args)
		@args = args
		@text = []
		@text << introduction
		@text << why_is_the_character_delivering_the_speech
		@text << experience_in_talking_to_theists
		@text << "\n\n" + what_is_god
		@text << nature_of_god if args[:nature_of_god]
		@text << view_of_bible if args[:view_of_bible]
		@text << life_after_death
		@text << presence_of_miracles if args[:miracles]
		@text << clear_ethical_standards if args[:clear_ethical_standards]
		@text << "\n\n#{room_reaction}\n\n"
		# @text << angels_and_demons
		@text = @text.join(" ")
	end

	def introduction
		"#{args[:name]} (#{args[:race]}#{args[:hispanic]} #{args[:wealth]} #{args[:education]}) entered a church, ready to deliver a speech to religious people."
	end

	def why_is_the_character_delivering_the_speech
		case
		when args[:religion_causes_problems] == :yes
			"#{args[:personal_pronoun].capitalize} saw religion as a force of evil that has to be countered for progress to be made. Only a speech will sway people away from religion and onto the straight path of atheism."
		when args[:religion_in_politics] == :religion_should_keep_out
			"#{args[:personal_pronoun].capitalize} saw religion as a progressive force in society, but one that has engaged in a horrible crime: interfering in the secular world and trying to sway the national government. This violation of the separation of church and state cannot stand!"
		else
			"#{args[:personal_pronoun].capitalize} believed religion as an outdated, obsolete entity that has to adapt to the changing times. Its followers should leave faith and adopt the truth of atheism."
		end
	end

	def diety_name
		case args[:fake_faith]
		when :simulation
			"the Unblinking Eye"
		when :karma
			"Karma"
		when :pantheism
			"the Collective Consciousness"
		when :alien
			"Alice"
		end
	end

	def what_is_god
		if args[:moral_reasoning]
			case args[:fake_faith]
			when :simulation
				"#{args[:name]} used #{args[:moral_reasoning]} to argue that the world is just one big simulation, run by a supercomputer called The Unblinking Eye."
			when :karma
				"#{args[:name]} used #{args[:moral_reasoning]} to make the claim that the universe is controlled by a magical force called 'Karma'."
			when :pantheism
				"#{args[:name]} used #{args[:moral_reasoning]} to suggest that everyone is part of one Collective Consciousness."
			when :alien
				"#{args[:name]} used #{args[:moral_reasoning]} to point out that there is no such thing as a 'God', only an omniscient, omnipotent, omnibenevolent being, who goes by the name of Alice."
			end				
		else
			case args[:fake_faith]
			when :simulation
				"#{args[:name]} outright claimed that the world is just one big simulation, run by a supercomputer called The Unblinking Eye."
			when :karma
				"#{args[:name]} outright claimed to make the claim that the universe is controlled by a magical force called 'Karma'."
			when :pantheism
				"#{args[:name]} outright claimed that everyone is part of one Collective Consciousness."
			when :alien
				"#{args[:name]} outright claimed that there is no such thing as a 'God', only an omniscient, omnipotent, omnibenevolent being, who goes by the name of Alice."
			end	
		end
	end

	def nature_of_god
		"#{args[:name]} argued that #{diety_name} was #{args[:nature_of_god]}."
	end

	def view_of_bible
		case args[:view_of_bible]
		when :bible_is_real_and_literal
			"#{args[:personal_pronoun].capitalize} then held out a personal copy of the Bible. This 'Bible' is the literal word of #{diety_name}, and it must be interpreted literally by a skilled scholar. #{args[:name]} quoted extensively from the Bible for the remainder of the speech."
		when :bible_is_real_but_metaphorical
			"#{args[:personal_pronoun].capitalize} then held out a personal copy of the Bible. This 'Bible' came directly from #{diety_name}, but ignorant people have chosen to interpret the book literally. A literal interpretion is one that is doomed to failure. Only metaphors lead to success."
		when :bible_is_a_lie
			"#{args[:personal_pronoun].capitalize} then mentioned the Bible, in brief, as a 'poor forgery' made by fools. #{diety_name.capitalize} does not need to communicate via books, but has other ways to sway society."
		when :bible_is_real_but_i_am_still_studying_it
			"#{args[:personal_pronoun].capitalize} then held out a personal copy of the Bible. This 'Bible' came directly from #{diety_name}, but its meaning is still shrouded in mystery. #{args[:name]} admitted to spending years studying this book, and expects to spend even more years understanding its secrets."
		end
	end

	def life_after_death
		case args[:life_after_death]
		when :hell_and_heaven
			"#{args[:name]} smiled when #{args[:personal_pronoun]} explained how Heaven and Hell are the same as the 'religious' people viewed it: good people go to Heaven and bad people go to Hell."
		when :only_hell_not_heaven
			"#{args[:name]} denounced the naivety of the religious people for believing in the existence of Heaven. Why must a person be rewarded for doing what he is supposed to do? The only thing that exist after this life is Hell. Good people are simply deleted from the universe after death."
		when :only_heaven_not_hell
			"#{args[:name]} became visibly upset when explaining how religious people are wrong for assuming the existence of Hell. Why must a person be punished forever just because he is bad? The only thing that exist after this life is Heaven. Bad people are simply deleted from the universe after death."
		when :only_heaven
			"#{args[:name]} explained how abandoning religion and truly believing in the #{diety_name} would allow them to go to Heaven."
		when :only_hell
			"#{args[:name]} explained how evil people are doomed to enter Hell for going against the commands of #{diety_name}."
		when :no_afterlife
			"#{args[:name]} laughed at the idea of an afterlife: there is no life after this world, only the cold comfort of oblivion."
		when :no_conventional_afterlife
			"#{args[:name]} attempted to explain how the afterlife worked, but the religious people could not understand his metaphysical terminology."
		end
	end

	def presence_of_miracles
		case args[:miracles]
		when :yes
			"#{args[:name]} then explained in depth how #{diety_name} is able to break scientific laws from time to time, causing 'miracles'."
		when :no
			"#{args[:name]} denounced the concept of miracles in the present day, claiming that #{diety_name} would never wish to break scientific laws."
		end
	end

	def room_reaction
		["The room remained silent, as the theists try to take into account what they have just heard.","The theists started to seriously consider #{args[:name]}'s message.","The theists started laughing at #{args[:name]}'s flawed theology.","The theists giggled, but still tried to pay their respects to the speaker.","The theists took notes."].sample
	end

	# def angels_and_demons
	# 	case args[:angels_and_demons]
	# 	when :yes
	# 		"The room remained silent, with the theists justexcept for a small rasping noise. #{args[:name]} knew "
	# 	end

	def clear_ethical_standards
		case args[:clear_ethical_standards]
		when :yes
			"#{args[:name]} declared that #{diety_name} strongly supports clear ethical standards that all humans must obey."
		when :no
			"#{args[:name]} laughed at the idea of 'clear ethical standards'; #{diety_name} supports ethical relativism in all affairs."
		end
	end 

	def experience_in_talking_to_theists
		case
		when (args[:preaching_atheism] == :yes) 
			"#{args[:name]} had extensive experience in preaching #{args[:possessive_pronoun]} views to theists. #{args[:personal_pronoun].capitalize} was not afraid."
		when (args[:preaching_atheism] == :sometimes)
			"#{args[:name]} sometimes preached #{args[:possessive_pronoun]} views to theists, but still felt afraid. #{calm_nerves}"
		when (args[:preaching_atheism] == :never)
			"#{args[:name]} had never preached #{args[:possessive_pronoun]} views to theists before, and freaked out. #{calm_nerves}"
		else
			"#{calm_nerves}"
		end
	end

	def calm_nerves
		case
		when args[:prayer] == :yes
			"#{args[:name]} uttered a quick prayer to #{diety_name} to calm #{args[:possessive_pronoun]} nerves."
		when args[:mediation] == :yes
			"#{args[:name]} meditated to relieve stress and to calm #{args[:possessive_pronoun]} nerves."
		when args[:prayer] == :sometimes
			"#{args[:name]} thought about praying to #{diety_name}, but decided that #{args[:personal_pronoun]} #{args[:personal_pronoun]} can handle this situation on #{args[:possessive_pronoun]} own and id not need to pray just yet."
		when args[:mediation] == :sometimes
			"#{args[:name]} thought about medidating, but decided that #{args[:personal_pronoun]} can handle this situation on #{args[:possessive_pronoun]} own and did not need to medidate just yet."
		else
			"#{args[:name]} slowly breathed in and out to calm #{args[:possessive_pronoun]} nerves."
		end
	end

end