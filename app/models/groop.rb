class Groop < ApplicationRecord
	belongs_to :user
	has_many   :friends, inverse_of: :groop
	accepts_nested_attributes_for :friends, reject_if: :all_blank, allow_destroy: true

	has_many :interactions

	validates_presence_of :user
	validate :at_least_one_friend

	def self.sorted
		self.all.sort_by{ |g| g.latest_date }
	end

	def latest_date
		if self.interactions.any?
			# self.interactions.map(&:date).min
			self.latest_interaction.date
		else
			self.created_at
		end
	end

	def latest_interaction
		self.interactions.sort_by{ |i| i.date }.last if self.interactions.any?
	end

	private

		def at_least_one_friend
			if self.friends.empty?
				self.errors.add :base, "Must have at least one friend!"
			end
		end
end
