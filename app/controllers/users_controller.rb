class UsersController < ApplicationController
	before_action :set_user, only: [:show, :destroy]

	def index
		@users = User.search_for(params[:query])
	end

	def show
		if @user.beers.count >= 1
			@beers = @user.beers.order(dateBrewed: :desc)
		else
			@beers = []
		end
	end

	def destroy
		
		@user.followings.destroy
		@user.followers.destroy
		@user.beers.destroy

		@user.destroy
		redirect_to users_path
	end

	def set_user
		@user = User.find(params[:id])
	end
end
