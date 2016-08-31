class School < ApplicationRecord
	validates_presence_of :name, :rating, :level

	def self.by_name
		order(:name)
	end

	def self.by_rating
		order(:rating)
	end

	def rating_stars
		"#{rating / 2} stars"
	end
end
