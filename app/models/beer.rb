class Beer < ActiveRecord::Base
	validates :name, :beer_style_id, :dateBrewed, presence: true
	
	has_and_belongs_to_many :users
	belongs_to :beer_style

	def self.search_for(query)
    @beers = Beer.where("name LIKE :query", query: "%#{query}%")
  end

end