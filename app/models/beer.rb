class Beer < ActiveRecord::Base
	#acts_as_indexed :fields => [:name]

	validates :name, length: {minimum:3, maximum: 20}, presence: true
	validates :beer_style_id, :dateBrewed, presence: true
	
	has_and_belongs_to_many :users
	belongs_to :beer_style
	has_many :comments

	def self.search_for(query)
		 @beers = Beer.where("LOWER(name) LIKE LOWER(:query)", query: "%#{query}%").order(dateBrewed: :desc)
  end
end