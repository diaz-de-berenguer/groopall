class Interaction < ApplicationRecord
	belongs_to :groop
	validates_presence_of :groop, :date, :type_of_interaction

	def to_icon
		icon = ""
		case self.type_of_interaction
		when "call"
			icon = '<i class="fa fa-phone" aria-hidden="true"></i>'
		when "message"
			icon = '<i class="fa fa-envelope" aria-hidden="true"></i>'
		when "hang"
			icon = '<i class="fa fa-handshake-o" aria-hidden="true"></i>'
		end

		return icon
	end
end
