class FollowingsController < ApplicationController

  before_action :set_user, only: [:index, :new, :show, :delete, :destroy]
  before_action :set_following, only: [:block, :unblock, :update]

  def index
  end

  def new
    @following = Followings.create(user: @user, follower: current_user, blocked: false)
    if @following.save
      @user.followers << @following
      redirect_to "/#{@user.username}"
    else
      flash[:error] = "Something went wrong, unable to save Following"
    end
  end

  def show
  end

  def block
    @following.blocked = true
    @following.save
    redirect_to "/#{@following.follower.username}"
  end

  def unblock
    @following.blocked = false
    @following.save
    redirect_to "/#{@following.follower.username}"
  end

  def delete
    Followings.find(params[:id]).destroy
    redirect_to "/#{@user.username}"
  end

  def destroy
    Followings.find(params[:id]).destroy
    redirect_to "/#{current_user.username}"
  end



  def set_user
    @user = User.find(params[:user_id])
  end

  def set_following
    @following = Followings.find(params[:id])
  end
end
