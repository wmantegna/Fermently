class BeerStyle < ActiveRecord::Base
	acts_as_indexed :fields => [:name, :category, :description]

	has_many :beers

	def self.search_for(query)
		if query.nil? || query.empty?
			@styles = BeerStyle.all
		else
			@styles = BeerStyle.find_with_index(query)
		end
	end
end
