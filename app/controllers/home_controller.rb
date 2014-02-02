class HomeController < ApplicationController
	def index
		@beers = Beer.all.order(dateBrewed: :desc).limit(10)
		@users = User.all.order(created_at: :desc).limit(10)
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

	def show_following
		@user = User.find_by(username: params[:username])
	end

	def show_followers
		@user = User.find_by(username: params[:username])
	end

=begin
	def brewerydb
		
		@b = BreweryDB::Client.new do |c|
			c.api_key = "b31b22b5b383cdcf086127513013704d"
		end

		@styles = @b.styles.all
  end
=end

end