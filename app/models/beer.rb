class Beer < ActiveRecord::Base
	validates :name, :beer_style_id, :dateBrewed, presence: true
	
	has_and_belongs_to_many :users
	belongs_to :beer_style

	def self.search_for(query)
    @beers = Beer.where("LOWER(name) LIKE LOWER(:query)", query: "%#{query}%")
  end

end