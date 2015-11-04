def determine_pronoun(sex_data)
	case sex_data
	when 1
		"he"
	when 2
		"she"
	end
end

def determine_race(race_data) #What is your race?
	case race_data
	when 1
		race = "a White"
	when 2
		race = "a Black"
	when 3
		race = "an Asian"
	when 4
		race = "a mixed race"
	when 5 #don't know, refuse to answer
		race = "an American"
	end
end

def determine_moral_reasoning(reasoning_data) #How do you determine what is right and wrong?
	case reasoning_data
	when 1
		moral_reasoning = "religious teachings and beliefs"
	when 2
		moral_reasoning = "philosophy and reason"
	when 3
		moral_reasoning = "practical experience and common sense"
	when 4
		moral_reasoning = "scientific information"
	when 9
		moral_reasoning = nil
	end
end

def determine_nature_of_god(god_data) #How do you view God?
	case god_data
	when 1
		"a personal, physical being"
	when 2
		"an impersonal force"
	else
		nil
	end
end

def determine_afterlife(args)
	heaven = determine_heaven(args[:heaven])
	hell = determine_hell(args[:hell])
	if heaven == :heaven_is_real && hell == :hell_is_real
		:hell_and_heaven
		# "Good people will be sent to Heaven while bad people will be sent to Hell."
	elsif hell == :hell_is_real && heaven == :heaven_is_a_lie
		:only_hell_not_heaven
		# "Heaven doesn't exist! It's all a lie to keep the masses docile! All that exist is Hell; the place where bad people go to suffer."
	elsif heaven == :heaven_is_real && hell == :hell_is_a_lie
		:only_heaven_not_hell
		# "Hell does not exist. No loving diety would create such a horrifying place! All that exist is Heaven; the place where good people go."
	elsif heaven == :heaven_is_real
		:only_heaven
		# "Good people will be sent to Heaven."
	elsif hell == :hell_is_real
		:only_hell
		# "Bad people will be sent to Hell"
	else
		:no_conventional_afterlife
	end
end

#Is there a Heaven, where people who led good lives are eternally rewarded?
def determine_heaven(heaven_data)
	case heaven_data
	when 1
		:heaven_is_real
	when 2
		:heaven_is_a_lie
	else
		:unknown
	end
end

#Is there a Hell, where people who have led bad lives and die without being
#sorry are eternally punished?
def determine_hell(hell_data)
	case hell_data
	when 1
		:hell_is_real
	when 2
		:hell_is_a_lie
	else
		:unknown
	end
end

def determine_view_of_bible(args)
	word_of_god = determine_word_of_god(args[:word_of_god])
	if word_of_god == :yes
		literalism = determine_literalism(args[:literalism])
	end
	if word_of_god == :yes && literalism == :yes
		:bible_is_real_and_literal
	elsif word_of_god == :yes && literalism == :no
		:bible_is_real_but_metaphorical
	elsif word_of_god == :yes
		:bible_is_real_but_i_am_still_studying_it
	elsif word_of_god == :no
		:bible_is_lie
	else
		nil
	end
end

#Is the Bible a word of god or written by men?
def determine_word_of_god(god_data)
	case god_data
	when 1
		:yes
	when 2
		:no
	else
		:unknown
	end
end

#Is the bible to be taken literally, word for word?
def determine_literalism(literalism_data)
	case literalism_data
	when 1
		:yes
	when 2
		:no
	else
		:unknown
	end
end

#Are miracles real?
#Are there angels and demons?
#Do religion causes more problems than it solves?
#Are there clear ethical standards of right and wrong?
#Is evolution true?
def evaluate_q39_data(q39_data)
	case
	when q39_data <= 2
		:yes
	when q39_data == 9
		nil
	else
		:no
	end
end

#Do you medidate?
#Do you share your opinion about religion to religious people?
def evaluate_q42_data(data)
	case
	when data <= 2
		:yes
	when data <= 4
		:sometimes
	when data == 5
		:never
	else
		:refuse_to_say
	end
end

#Do you pray?
def evaluate_prayer(data)
	case
	when data <= 4
		:yes
	when data <= 6
		:sometimes
	when data == 7
		:never
	else
		:refuse_to_say
	end
end

def evaluate_divine_healing(data)
	case
	when data == 1
		:yes
	when data == 2
		:no
	else
		:refuse_to_say
	end
end

def evaluate_religion_in_politics(data)
	case
	when data == 1
		:religion_should_keep_out
	when data == 2
		:religion_should_say_views
	else
		:refuse_to_say
	end
end

def evaluate_morality_in_politics(data)
	case
	when data == 1
		:government_should_promote_morality
	when data == 2
		:government_is_too_involved
	else
		:refuse_to_say
	end
end

def evaluate_hispanic_data(hispanic_data)
	case hispanic_data
	when 1
		:yes
	when 2
		:no
	else
		:refuse_to_say
	end
end
