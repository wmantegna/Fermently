class BeersUsers < ActiveRecord::Base
	belongs_to :users
	belongs_to :beers
end
