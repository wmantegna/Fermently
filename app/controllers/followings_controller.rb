class FollowingsController < ApplicationController

  before_action :set_user, only: [:index, :new, :show, :destroy]

  def index
  end

  def new
  	@user.followers << Followings.create(follower: current_user)
  	redirect_to "/#{@user.username}"
  end

  def show
  end

  def delete
    @following = Followings.find(params[:id])
  end

  def destroy
    Followings.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
