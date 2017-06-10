class Groop < ApplicationRecord
	has_many :friends
	accepts_nested_attributes_for :friends

	validate :at_least_one_friend

	private

		def at_least_one_friend
			if self.friends.empty?
				self.errors.add :base, "Must have at least one friend!"
			end
		end
end
