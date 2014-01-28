class HomeController < ApplicationController
	def index
		@beers = Beer.all.order(dateBrewed: :desc).limit(10)
	end

	def about
	end
	
	def profile
		@beers = User.find_by(username: params[:username]).beers.order(dateBrewed: :desc)
	end
end