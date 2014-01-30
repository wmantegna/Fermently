class FollowingsController < ApplicationController

  def index
  	@user = User.find(params[:user_id])
  end

  def new
  	@user = User.find(params[:user_id])
  	@user.followers << Followings.create(follower: current_user)
  	redirect_to "/#{@user.username}"
  end

  def destroy
  end
end
