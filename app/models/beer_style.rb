class BeerStyle < ActiveRecord::Base

	has_many :beers

	def self.search_for(query)
			@styles = BeerStyle.where("LOWER(name) LIKE LOWER(:query) OR LOWER(category) LIKE LOWER(:query) OR LOWER(description) LIKE LOWER(:query)", query: "%#{query}%").order(name: :asc)
	end
end
