class Groop < ApplicationRecord
	belongs_to :user
	has_many   :friends, inverse_of: :groop
	accepts_nested_attributes_for :friends, reject_if: :all_blank, allow_destroy: true

	validates_presence_of :user
	validate :at_least_one_friend

	private

		def at_least_one_friend
			if self.friends.empty?
				self.errors.add :base, "Must have at least one friend!"
			end
		end
end
