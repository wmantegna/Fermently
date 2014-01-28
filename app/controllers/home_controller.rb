class HomeController < ApplicationController
	def index
		@beers = Beer.all.order(dateBrewed: :desc).limit(10)
	end

	def about
	end
	
	def profile
		if current_user.beers.count < 1
			@beers = nil
		else
			@beers = User.find_by(username: params[:username]).beers.order(dateBrewed: :desc)
		end
	end
end