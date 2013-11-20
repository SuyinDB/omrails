module ApplicationHelper

	def other_conversation_people(conversation)
		
		# find everyone but the current users messages
		other_people = conversation.recipients.keep_if { |m| m != current_user }


		if other_people.any?
			# a list of all the other people's messages
			# then map them to their name
			# then getting unique ones
			# then putting it to a nice sentence (to_sentence is part of rails)
			other_people.map { |m| m.username }.uniq.to_sentence
		else
			"myself"
		end
	end

end
