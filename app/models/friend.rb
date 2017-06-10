class Friend < ApplicationRecord
	belongs_to :groop
	validates_presence_of :groop
end
