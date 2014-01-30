class HomeController < ApplicationController
	def index
		@beers = Beer.all.order(dateBrewed: :desc).limit(10)
	end

	def about
	end
	
	def profile
		@user = User.find_by(username: params[:username])

		if @user.beers.count >= 1
			@beers = @user.beers.order(dateBrewed: :desc)
		else
			@beers = []
		end
	end
end