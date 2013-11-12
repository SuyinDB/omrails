module ApplicationHelper

	def other_conversation_people(conversation)
		other_people = conversation.messages.reject { |m| m.sender == current_user }
		if other_people.any?
			other_people.map { |m| m.sender.name }.uniq.to_sentence
		else
			"myself"
		end
	end

end
